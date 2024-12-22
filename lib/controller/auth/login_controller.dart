import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/core/services/services.dart';
import 'package:health/data/datasource/remote/login_data.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey();
  LoginData loginData = LoginData(Get.find());
  MyServices services = Get.find();
  bool isshowpassword = true;

  Login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.login(email.text, password.text);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          services.sharedPreferences
              .setString("id", response['data']['users_id'].toString());
          services.sharedPreferences
              .setString("username", response['data']['users_username']);
          services.sharedPreferences
              .setString("email", response['data']['users_email']);
          services.sharedPreferences
              .setString("phone", response['data']['users_phone'].toString());
          services.sharedPreferences
              .setString("age", response['data']['users_age'].toString());
          services.sharedPreferences
              .setString("image", response['data']['users_image'].toString());
          services.sharedPreferences.setString("step", "2");
          Get.offAllNamed(AppRoutes.homescrren);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email or Password is not correct ! ");
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    } else {}
  }

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
}
