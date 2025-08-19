import 'package:chatapp/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/const.dart';

class chatpage extends StatelessWidget {
  static String id = "chatpage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kprimarycolor,
          // title: const Text('Chat Page', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          title: Row(
            children: [
              Image.asset(klogo),
              const Text('Chat Page', style: TextStyle(color: Colors.white))
            ],
          )),
      // body: const Center(
      //   child: Text('Welcome to the Chat Page!'),
      // ),
      body: Container(
        child: const Text("I am a new user"),
      ),
    );
  }
}
