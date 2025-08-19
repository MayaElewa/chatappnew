import 'package:chatapp/pages/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/text_field.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static const String routeName = 'RegisterPage';
  static String id = 'RegisterPage';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

// Function(String)? onchanged;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:
          isLoading, // Set to true when you want to show the loading indicator
      child: Scaffold(
        backgroundColor: const Color(0xff314F6A),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            /////     key: ,
            child: ListView(
              children: [
                const SizedBox(height: 1),
                Image.asset("assets/images/scholar.png"),
                const SizedBox(height: 0.4),
                const Padding(
                  padding: EdgeInsets.only(right: 270.0),
                  child: Text(
                    'Register',
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
                    obscureText: false),
                const SizedBox(height: 10),
                TextFieldcustom(
                  onchanged: (data) {
                    password = data;
                         const Color.fromARGB(255, 255, 255, 255);
                  },
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////
                CustumButton(
                  //  'Register', // Add the required positional argument (e.g., title)
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true; // Show loading indicator
                      setState(
                          () {}); // Update the state to reflect the loading status
                      // Update the state to reflect the loading status

                      // var auth = FirebaseAuth.instance;
                      // UserCredential user = await auth.createUserWithEmailAndPassword(
                      //   email: email!,
                      //   password: password!,
                      // ); => way 1

                      try {
                        // => way 2
                        await registerUser();

                        showSnackBar(context, "Account created successfully!",
                            backgroundColor: Colors.green);

                        Navigator.pushNamed(context, chatpage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          showSnackBar(context, "weak-password",
                              backgroundColor: Colors.orange);
                        } else if (e.code == "email-already-in-use") {
                          showSnackBar(context, "email-already-in-use",
                              backgroundColor: Colors.red);
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }
                    //  ),

                    else {}
                  },
                  title: 'Register',
                ),
                const SizedBox(height: 20),

                // const SizedBox(height: 30);

                ////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        " LOGIN",
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 63, 219),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
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

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
