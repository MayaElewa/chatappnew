import 'package:chatapp/pages/message.dart';
import 'package:chatapp/widgets/const.dart';
import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  chatbubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Messages message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width * 0.7, // bubble max width
          ),
          decoration: BoxDecoration(
            color: kprimarycolor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)),
          ),
          child: Text(message.message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ))),
    );
  }
}







class chatbubbleForFriend extends StatelessWidget {
  chatbubbleForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Messages message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width * 0.7, // bubble max width
          ),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32)),
          ),
          child: Text(message.message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ))),
    );
  }
}
