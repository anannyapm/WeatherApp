import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String property;
  final String value;

  const TextCard({super.key, required this.property, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        property,
        style: const TextStyle(color: Colors.black, fontSize: 17),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        value,
        style: const TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),
      ),
    ]);
  }
}
