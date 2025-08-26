import 'package:chatapp/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/chatbubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/pages/message.dart';


class chatpage extends StatelessWidget {
  static String id = "chatpage";

//  chatpage({super.key});

  final _controller = ScrollController();
  final currentUser = FirebaseAuth.instance.currentUser;

//  FirebaseFirestore firestore = FirebaseFirestore.instance;
//  CollectionReference users = FirebaseFirestore.instance.collection("messages");
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagescollections);
  TextEditingController controller = TextEditingController();

  chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    // CollectionReference users = FirebaseFirestore.instance.collection("users");

    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Messages> messagelist = [];
             for (final d in snapshot.data!.docs) {
    print(d.data());
  }
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist.add(Messages.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kprimarycolor,
                // title: const Text('Chat Page', style: TextStyle(color: Colors.white)),
                // cen terTitle: true,
                title: Row(
                  children: [
                    Image.asset(
                      klogo,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Chat Page',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                centerTitle: true,
              ),
              // body: const Center(
              //   child: Text('Welcome to the Chat Page!'),
              // ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      reverse: true,
                      itemCount: messagelist.length,
                      itemBuilder: (context, index) {
                        return messagelist[index].id == email? chatbubble(
                          message: messagelist[index],
                        ): chatbubbleForFriend( message: messagelist[index],) ;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                        controller: controller,

                
                        onSubmitted: (data) {
                         messages.add({
  kMessage: data.trim(),                         // ✅ actual text
  kCreatedAt: FieldValue.serverTimestamp(),      // ✅ server timestamp
  kId: currentUser?.email?? "unknown",
                         


                          });
                          controller.clear();
                          _controller.animateTo(
                            0, // scroll to latest message
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
  );
                        },
                        

                        // onSubmitted: (data) {
                        //   messages.add({"message": data});
                        //   controller.clear();
                        // },
            
                decoration: InputDecoration(
                            hintText: "send a message",
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: kprimarycolor,
                              ),
                              onPressed: () {
                                final text = controller.text.trim();
                                if (text.isNotEmpty) {
                                  messages.add({
                                    kMessage: text,
                                    kCreatedAt: FieldValue.serverTimestamp(),
                                    kId: email,
                                  });
                                  controller.clear();
                                  _controller.animateTo(
                                    0, // scroll to latest message
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                }
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: kprimarycolor,
                                ),
                                ),
                                ),
                    ),
                  ),
                                ],
                                ),
                 
                  //   child: ListView.builder(
                  // itemBuilder: (context, index) {
                  // return const chatbubble();
                  //}
                
              );
            
          } else {
            // return const Text("loading...");
            return const Center(child: CircularProgressIndicator());
          }
        });
    //  future: null,
  }
}
