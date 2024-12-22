import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/services/services.dart';

class ProfileController extends GetxController {
  MyServices services = Get.find();
  String? image;
  String? name;
  String? age;

  Map<String, IconData> mp = {
    "Profile": Icons.person_2_outlined,
    "Contact Us": Icons.contacts_outlined,
    "Logout": Icons.logout_outlined,
  };

  void goToProfile() {
    Get.toNamed(AppRoutes.profileinfo,arguments: {
      "Email":services.sharedPreferences.getString("email"),
      "Telephone":services.sharedPreferences.getString("phone"),
      "Age":services.sharedPreferences.getString("age"),
      "username":services.sharedPreferences.getString("username"),
    });
  }

  void goToLogin() {
    services.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    image = services.sharedPreferences.getString("image")!;
    name = services.sharedPreferences.getString("username")!;
    age = services.sharedPreferences.getString("age")!;
    // TODO: implement onInit
    super.onInit();
  }
}
