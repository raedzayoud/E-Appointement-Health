import 'package:get/get.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/services/services.dart';
import 'package:health/data/datasource/remote/appointement_data.dart';
import 'package:health/data/model/appointementmodel.dart';
import 'package:health/data/model/doctormodel.dart';

class AppoitementsdoctorresheduleController extends GetxController {
  DateTime? selectedDay;
  DateTime? focusedDay;
  String? selectedTime;
  AppointementData appointementData = AppointementData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Doctormodel? doctormodel;
  String? appointementid;
  String? doctorid;
  appointementmodel? a;
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
    selectedDay = Get.arguments["Date"] != null
        ? DateTime.tryParse(Get.arguments["Date"].toString())
        : DateTime.now();
    focusedDay = Get.arguments["Date"] != null
        ? DateTime.tryParse(Get.arguments["Date"].toString())
        : DateTime.now();
    selectedTime = Get.arguments["heure"];
    appointementid = Get.arguments["appointementid"];
    doctorid = Get.arguments["doctorid"];
    a = Get.arguments["appointementmodel"];
    super.onInit();
  }
}
