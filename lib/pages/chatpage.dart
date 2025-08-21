import 'package:chatapp/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/chatbubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatpage extends StatelessWidget {
  static String id = "chatpage";

  chatpage({super.key});

  final _controller = ScrollController();

//  FirebaseFirestore firestore = FirebaseFirestore.instance;
//  CollectionReference users = FirebaseFirestore.instance.collection("messages");
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagescollections);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kprimarycolor,
            // title: const Text('Chat Page', style: TextStyle(color: Colors.white)),
            // centerTitle: true,
            title: Row(
              children: [
                Image.asset(
                  klogo,
                  height: 50,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('Chat Page', style: TextStyle(color: Colors.white)),
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
                  reverse: true,
                  controller: _controller,
                  padding: const EdgeInsets.all(8.16),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const chatbubble();
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({"message": data});
                      controller.clear();
                    },

                    // onSubmitted: (data) {
                    //   messages.add({"message": data});
                    //   controller.clear();
                    // },
                    decoration: InputDecoration(
                        hintText: "send a message",
                        suffixIcon: Icon(
                          Icons.send,
                          color: kprimarycolor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: kprimarycolor,
                            )))),
              ),

              //   child: ListView.builder(
              // itemBuilder: (context, index) {
              // return const chatbubble();
              //}
            ],
          ),
        );
      },
      future: null,
    );
  }
}
// Builder(builder: builder)

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimarycolor,
//         // title: const Text('Chat Page', style: TextStyle(color: Colors.white)),
//         // centerTitle: true,
//         title: Row(
//           children: [
//             Image.asset(
//               klogo,
//               height: 50,
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             const Text('Chat Page', style: TextStyle(color: Colors.white)),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       // body: const Center(
//       //   child: Text('Welcome to the Chat Page!'),
//       // ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                reverse: true,
//                  controller: _controller,
//               padding: const EdgeInsets.all(8.16),
//               itemCount: 20,
//               itemBuilder: (context, index) {
//                 return const chatbubble();
//               },
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: TextField(
//                 controller: controller,
//                 onSubmitted: (data) {
//                   messages.add({"message": data});
//                     controller.clear();

//                 },

                
//                 // onSubmitted: (data) {
//                 //   messages.add({"message": data});
//                 //   controller.clear();
//                 // },
//                 decoration: InputDecoration(
//                     hintText: "send a message",
//                     suffixIcon: Icon(
//                       Icons.send,
//                       color: kprimarycolor,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(
//                           color: kprimarycolor,
//                         )))),
//           ),

//           //   child: ListView.builder(
//           // itemBuilder: (context, index) {
//           // return const chatbubble();
//           //}
//         ],
//       ),
//     );
//   }
// }

// ]
//)
//)

//body:


// #274460 
//#006488 -> me
