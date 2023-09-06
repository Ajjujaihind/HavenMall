import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;

  const PrimaryButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
            )));
  }
}
