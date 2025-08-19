import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  //constructor
  const CustumButton({
    Key? key,
    //required this.title,
    this.onTap,
    required this.title,
    //this.hinttitle ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
