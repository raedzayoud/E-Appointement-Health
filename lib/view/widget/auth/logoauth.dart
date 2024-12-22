import 'package:flutter/material.dart';
import 'package:health/core/constant/imageassets.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40),
      height: 150,
    child: ClipOval(child: Transform.scale(
    scale: 1.4,  
    child: Image.asset(AppImageassets.secondlogo,scale: 0.1,))));
  }
}