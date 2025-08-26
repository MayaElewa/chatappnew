import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/text_field.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chatapp/pages/chatpage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static const String routeName = 'loginPage';
  static String id = 'loginPage';
  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  String? email, password;
  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: const Color(0xff314F6A),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 1),
                Image.asset("assets/images/scholar.png"),
                const SizedBox(height: 0.4),
                const Padding(
                  padding: EdgeInsets.only(right: 270.0),
                  child: Text(
                    'Login Here',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                TextFieldcustom(
                  onchanged: (data) {
                    email = data;
                    const Color.fromARGB(255, 255, 255, 255);
                  },
                  hintText: "email",
                  obscureText: false,
                  validator: (value) {},
                ),
                const SizedBox(height: 10),
                TextFieldcustom(
                  onchanged: (data) {
                    password = data;
                    const Color.fromARGB(255, 255, 255, 255);
                  },
                  hintText: "password",
                  obscureText: true,
                  validator: (value) {},
                ),
                const SizedBox(height: 20),
                CustumButton(
                  title: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true; // Show loading indicator
                      setState(
                          () {}); // Update the state to reflect the loading status
                      // Update the state to reflect the loading status

                      // var auth = FirebaseAuth.instance;
                      // UserCredential user = await auth.createUserWithEmailAndPassword(
                      //   email: email!,
                      //   password: password!,
                      // ); => way 1

                      try {
                        await loginUser();
                        Navigator.pushNamed(context, chatpage.id,
                            arguments: email);

                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );

                        showSnackBar(context, "Login successful!",
                            backgroundColor: Colors.green);
                        Navigator.pushNamed(context, chatpage.id);

                        // => way 2
                        // await loginUser();

                        // showSnackBar(context, "success!",
                        //     backgroundColor: Colors.green);

                        // Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "user-not-found") {
                          showSnackBar(context, "user-not-found",
                              backgroundColor: Colors.orange);
                        } else if (e.code == "wrong-password") {
                          showSnackBar(context, "wrong-password",
                              backgroundColor: Color.fromARGB(255, 184, 5, 5));
                        } else {
                          showSnackBar(context,
                              e.message ?? "An unknown error occurred");
                        }
                      }
                      isloading = false;
                      setState(() {});
                    }
                    //  ),

                    else {
                      showSnackBar(
                          context, "Please enter a valid email and password");
                    }
                  },
                  //    title: 'Login',
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'RegisterPage');
                      },
                      child: const Text(
                        " REGISTER",
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 63, 219),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message,
      {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
