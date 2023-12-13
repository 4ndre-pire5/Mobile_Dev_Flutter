import 'package:flutter/material.dart';

const appJson = 'application/json; charset=UTF-8';

void alert(context, String title) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    )
  );
}
