import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  const MyInput(
      {super.key,
      required this.text,
      required this.change,
      this.isObscure = false});

  final String text;
  final Function(String) change;
  final bool isObscure;

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscure,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
        border: const UnderlineInputBorder(),
        labelText: widget.text,
      ),
      onChanged: widget.change,
    );
  }
}
