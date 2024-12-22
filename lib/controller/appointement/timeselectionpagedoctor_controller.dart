import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitements_controller.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/core/services/services.dart';
import 'package:health/data/datasource/remote/appointement_data.dart';
import 'package:health/data/datasource/remote/time_data.dart';
import 'package:health/data/model/appointementmodel.dart';
import 'package:health/data/model/doctormodel.dart';

class TimeselectionpagedoctorController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  TimeData timeData = TimeData(Get.find());
  AppointementData timeData1 = AppointementData(Get.find());
  MyServices myServices = Get.find();
  List<appointementmodel> list = [];

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String? selectedTime;
  AppointementData appointementData = AppointementData(Get.find());
  Doctormodel? doctormodel;

  String doctorId = "";
  String appointementdate = "";

  void onTimeSelected(String? time) {
    selectedTime = time;
    update();
  }

  loadTimeIsNotAvailable(String doctorId, String appointementdate) async {
    statusRequest = StatusRequest.loading;
    update();
    list.clear();
    var response = await timeData.manageTime(doctorId, appointementdate);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list = data.map((e) => appointementmodel.fromJson(e)).toList();
        print(list);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  void MakeAppointement(
      String doctorid, DateTime date, String appointement_heure) async {
    if (selectedTime == null || selectedDay == null) {
      Get.defaultDialog(
        title: "Warning",
        titleStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColor.red),
        content: Text("Please choose time to make the appointement"),
      );
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await appointementData.add(
          myServices.sharedPreferences.getString("id")!,
          doctorid,
          date,
          appointement_heure);
      if (response == null) {
        statusRequest = StatusRequest.failed;
      }
      statusRequest = HandleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoutes.successappointement);
        } else {
          statusRequest = StatusRequest.failed;
        }
      }

      update();
    }
  }

  @override
  void onInit() {
    doctormodel = Get.arguments["doctormodel"];
    doctorId = Get.arguments["doctorid"];
    appointementdate = Get.arguments["appointementdate"];
    selectedDay = Get.arguments["selectedDay"];
    focusedDay = Get.arguments["focusedDay"];
    loadTimeIsNotAvailable(doctorId,appointementdate);
    super.onInit();
  }
}
