import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/core/function/uploadfile.dart';
import 'package:health/data/datasource/remote/signup_data.dart';

class SignupController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  SignupData signupData = SignupData(Get.find());

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  void signup() async {
    if (file == null) {
      Get.defaultDialog(
          content: const Text(
            "Please choose an image",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          title: "Warning",
          titleStyle: const TextStyle(
              color: AppColor.red, fontSize: 19, fontWeight: FontWeight.bold));
      return;
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map<String, String> data = {
        "username": username.text,
        "password": password.text,
        "age": age.text,
        "phone": phone.text,
        "email": email.text,
      };
      var response = await signupData.signup(data, file!);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoutes.login);
          Get.snackbar(
            "Success", // Title
            "Your account has been added successfully", // Message
            snackPosition:
                SnackPosition.TOP, // Optional: Position of the Snackbar
            backgroundColor: AppColor
                .black, // Optional: Background color for the Snackbar
            colorText: Colors.white, // Optional: Text color
            duration: Duration(
                seconds: 3), // Optional: How long the Snackbar is visible
          );
        } else {
          Get.defaultDialog(
              title: "Warning",
              titleStyle: const TextStyle(
                  color: AppColor.red,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
              middleText: "Email or Phone aleardy exists");
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    }
  }
}
