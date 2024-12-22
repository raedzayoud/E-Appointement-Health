import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/profile_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/linkapi.dart';
import 'package:health/view/widget/profile/customname.dart';
import 'package:health/view/widget/profile/parametere.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(
        builder: (controller) => Scaffold(
              body: Container(
                color: AppColor.white,
                child: Stack(
                  children: [
                    // Background container with primary color
                    Container(
                      color: AppColor.primaycolor,
                      height: 300,
                    ),
                    // Profile content with ListView
                    ListView(
                      children: [
                        SizedBox(
                            height: 20), // Space for the background container
                        Center(
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 4), // Shadow position
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: HashCachedImage(
                                imageUrl:
                                    "${AppLinkApi.imagesuser}/${controller.image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Customname(
                          ageandgendor: "${controller.age} years old",
                          username: "${controller.name}",
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Parametere(),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
