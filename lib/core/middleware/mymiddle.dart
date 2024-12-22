import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/services/services.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices services=Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(services.sharedPreferences.getString("step")=="2"){
      return RouteSettings(name: AppRoutes.homescrren);
    }
    if(services.sharedPreferences.getString("step")=="1"){
      return RouteSettings(name: AppRoutes.login);
    }
  }
}