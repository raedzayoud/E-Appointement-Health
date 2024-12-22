import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/profile_controller.dart';
import 'package:health/core/constant/color.dart';

class Parametere extends GetView<ProfileController> {
  const Parametere({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      height: 250,
      child: Card(
        color: AppColor.white,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            ...controller.mp.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        if (entry.key == "Logout") {
                          controller.goToLogin();
                        }
                        if (entry.key == "Profile") {
                          controller.goToProfile();
                        }
                      },
                      child: Icon(entry.value, color: AppColor.primaycolor),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        if (entry.key == "Logout") {
                          controller.goToLogin();
                        }
                         if (entry.key == "Profile") {
                          controller.goToProfile();
                        }
                      },
                      child: Text(
                        entry.key,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
