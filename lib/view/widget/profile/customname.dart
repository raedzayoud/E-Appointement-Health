import 'package:flutter/material.dart';
import 'package:health/core/constant/color.dart';

class Customname extends StatelessWidget {
  final String username;
  final String ageandgendor;
  const Customname(
      {super.key, required this.username, required this.ageandgendor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Center(
          child: Text(
            username,
            style: TextStyle(color: AppColor.white, fontSize: 18),
          ),
        ),
        subtitle: Center(
          child: Text(
            ageandgendor,
            style: TextStyle(color: AppColor.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
