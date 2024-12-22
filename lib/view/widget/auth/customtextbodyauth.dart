import 'package:flutter/material.dart';

class Customtextbodyauth extends StatelessWidget {
  final String body;
  const Customtextbodyauth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600
          )
        ));
  }
}