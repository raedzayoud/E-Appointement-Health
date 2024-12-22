import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/imageassets.dart';
import 'package:health/core/constant/routes.dart';
import 'package:lottie/lottie.dart';

class Successappointement extends StatelessWidget {
  const Successappointement({super.key});

  @override
  Widget build(BuildContext context) {
    // Automatically navigate to the home page after a delay
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.homescrren); // Replaces the current route with Home
    });

    return Scaffold(
      body: Container(
        color: AppColor.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Animation
              SizedBox(
                height: 100,
                child: Lottie.asset(AppImageassets.success),
              ),
              const SizedBox(height: 20),
              // Success Message
              Text(
                "Your appointment has been added successfully",
                style: TextStyle(
                  color: AppColor.primaycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
