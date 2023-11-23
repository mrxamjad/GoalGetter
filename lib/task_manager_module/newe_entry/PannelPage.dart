import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Pannel extends StatelessWidget {
  Pannel({super.key, required this.tittle, required this.isRequired});
  String tittle;
  String isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: tittle, style: TextStyle(fontSize: 20)),
            TextSpan(text: isRequired, style: TextStyle(color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}
