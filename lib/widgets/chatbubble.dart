import 'package:chatapp/widgets/const.dart';
import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  const chatbubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10, top: 26, bottom: 26, right: 5 ),
          margin:  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
           //  color: kprimarycolor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)
                ),
                  color: kprimarycolor,
          ),

          child:
              const Text("I am a new user ",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
    );
  }
}
