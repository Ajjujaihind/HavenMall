import 'package:flutter/material.dart';

class TopTittle extends StatelessWidget {
  final String title;
  final String subtitle;

  const TopTittle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
