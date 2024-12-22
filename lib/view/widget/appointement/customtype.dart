import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitements_controller.dart';
import 'package:health/core/constant/color.dart';

class Customtype extends GetView<AppoitementsController> {
  final String type;
  const Customtype({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.clickonthis(type);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: controller.type == type
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(0),
              color:
                  controller.type == type ? AppColor.primaycolor : AppColor.white,
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              type,
              style: TextStyle(
                  color: controller.type == type ? AppColor.white : AppColor.black,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

}