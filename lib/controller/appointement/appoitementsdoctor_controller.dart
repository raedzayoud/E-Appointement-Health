import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/core/services/services.dart';
import 'package:health/data/datasource/remote/appointement_data.dart';
import 'package:health/data/model/doctormodel.dart';

class AppoitementsdoctorController extends GetxController {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String? selectedTime;
  AppointementData appointementData = AppointementData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Doctormodel ? doctormodel;
  List<String> timeSlots = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
  ];

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay = selectedDay;
    this.focusedDay = focusedDay;
    update();
  }

  void onTimeSelected(String? time) {
    selectedTime = time;
    update();
  }
  
  @override
  void onInit() {
    doctormodel=Get.arguments["doctormodel"];
    super.onInit();
  }



}
