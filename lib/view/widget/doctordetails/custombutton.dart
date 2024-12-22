import 'package:flutter/material.dart';
import 'package:health/core/constant/color.dart';

class Custombutton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Custombutton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.primaycolor,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        child: MaterialButton(
            child: Text(
              text,
              style:
                  TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed));
  }
}
