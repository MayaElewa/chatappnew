import 'package:flutter/material.dart';

class TextFieldcustom extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final Function(String)? onchanged;

  const TextFieldcustom({
    Key? key,
    this.hintText,
    this.obscureText = false,
    this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      obscureText: obscureText,
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter text',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 222, 220, 228),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}
