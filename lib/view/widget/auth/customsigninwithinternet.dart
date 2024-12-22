import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/imageassets.dart';
import 'package:health/core/constant/routes.dart';

class Customsigninwithinternet extends StatelessWidget {
  const Customsigninwithinternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(10),
          onPressed: () {
            Get.offAllNamed(AppRoutes.homescrren);
          },
          color: AppColor.primaycolor,
          textColor: AppColor.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Continue with Google",
                style: TextStyle(fontSize: 18),
              ),
              Transform.scale(
                  scale: 1,
                  child: ClipOval(
                      child: Image.asset(
                    AppImageassets.google,
                  ))),
            ],
          )),
    );
  }
}
