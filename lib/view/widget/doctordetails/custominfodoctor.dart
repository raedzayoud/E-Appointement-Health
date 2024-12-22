import 'package:flutter/material.dart';
import 'package:health/core/constant/color.dart';

class Custominfodoctor extends StatelessWidget {
  final String name;
  final String nbre;
  const Custominfodoctor({super.key, required this.name, required this.nbre});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.primaycolor,
        ),
        height: 100,
        width: 100,
        margin: EdgeInsets.only(right: 10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(nbre, style: TextStyle(color: AppColor.white)),
            ],
          ),
        ),
      )
    ]));
  }
}
