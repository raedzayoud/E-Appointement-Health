import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health/controller/home_controller.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/core/services/services.dart';
import 'package:health/data/datasource/remote/appointement_data.dart';
import 'package:health/data/datasource/remote/feedback_data.dart';
import 'package:health/data/model/appointementmodel.dart';
import 'package:intl/intl.dart';

class AppoitementsController extends GetxController {
  String type = "Upcoming";
  String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
  String currentTime = DateFormat('hh:mm a').format(DateTime.now());
  StatusRequest statusRequest = StatusRequest.none;
  AppointementData appointementData = AppointementData(Get.find());
 // HomeController homeController = Get.find();
  MyServices myServices = Get.find();
  List<appointementmodel> list = [];
  List<appointementmodel> listcancelled = [];
  List<appointementmodel> listcompleted = [];
  String doctorid = "0";
  bool isFeedback = false;
  FeedbackData feedbackData = FeedbackData(Get.find());

  // reloadHome() async {
  //   await homeController.getData();
  // }

  clickonthis(String val) {
    type = val;
    update();
  }

  LoadDataUpcoming() async {
    statusRequest = StatusRequest.loading;
    update();
    list.clear();
    var response = await appointementData
        .view(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list = data.map((e) => appointementmodel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  CancelAppointement(String appointementId) {
    Get.defaultDialog(
      title: "Warning",
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: AppColor.red,
      ),
      middleText: "Are you sure you want to delete this appointment?",
      middleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      cancelTextColor: AppColor.black,
      buttonColor: AppColor.red,
      onConfirm: () async {
        try {
          // Show loading indicator
          statusRequest = StatusRequest.loading;
          update();

          // Perform the cancellation operation
          await appointementData.cancelled(
            myServices.sharedPreferences.getString("id")!,
            appointementId,
          );

          // Update status to success
          statusRequest = StatusRequest.success;
          update();
          await LoadDataUpcoming();

          await viewCancelled();

          // Close the dialogs
          Get.back(); // Close the confirmation dialog
        } catch (e) {
          // Handle errors
          statusRequest = StatusRequest.failed;
          update();
          Get.snackbar(
            "Error",
            "Failed to cancel the appointment: $e",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } finally {
          Get.back(); // Ensure the confirmation dialog is closed
        }
      },
      onCancel: () {
        Get.back(); // Close the dialog
      },
    );
  }

  viewCancelled() async {
    statusRequest = StatusRequest.loading;
    update();
    listcancelled.clear();
    var response = await appointementData
        .viewcancelled(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        listcancelled = data.map((e) => appointementmodel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  isCompleted(String appointementDate, String appointementHeure,
      String appointementid, String doctorId) {
    // Parse the appointment date
    DateTime appointementDateTime = DateTime.parse(appointementDate);

    // Handle time parsing with AM/PM format
    bool isPM = appointementHeure.contains("PM");
    List<String> timeParts = appointementHeure
        .replaceAll("AM", "")
        .replaceAll("PM", "")
        .trim()
        .split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);

    // Convert to 24-hour format if necessary
    if (isPM && hours < 12) {
      hours += 12; // Convert PM hours to 24-hour format
    } else if (!isPM && hours == 12) {
      hours = 0; // Convert 12 AM to 0 hours (midnight)
    }

    // Add the time to the date
    appointementDateTime = appointementDateTime.add(
      Duration(
        hours: hours,
        minutes: minutes,
      ),
    );

    // Get the current date and time
    DateTime now = DateTime.now();

    // Check if the appointment is completed
    if (now.isAfter(appointementDateTime)) {
      //success
      ModifyAppointementToCompleted(appointementid, doctorId);
      // homeController.getData();
    } else {
      Get.defaultDialog(
        title: "Warning",
        titleStyle: TextStyle(
          color: AppColor.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        content: Text(
          "The meeting has not yet taken place.",
          style: TextStyle(fontSize: 15),
        ),
      );
    }
  }

  ModifyAppointementToCompleted(String appointementid, String doctorId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await appointementData.completedapp(
        myServices.sharedPreferences.getString("id")!,
        appointementid,
        doctorId);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        await LoadDataUpcoming();
        await LoadDataCompleted();
        Get.defaultDialog(
          title: "Success",
          titleStyle: TextStyle(
            color: AppColor.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          content: Text(
            "The meeting has taken place.",
            style: TextStyle(fontSize: 15),
          ),
        );
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  LoadDataCompleted() async {
    statusRequest = StatusRequest.loading;
    update();
    listcompleted.clear();
    var response = await appointementData
        .viewcompletedapp(myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        listcompleted = data.map((e) => appointementmodel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  goToReschedule(String date, String heure, String appointementid,
      String doctorId, appointementmodel a) {
    Get.toNamed(AppRoutes.recheduleappointement, arguments: {
      "Date": date,
      "heure": heure,
      "appointementid": appointementid,
      "doctorid": doctorId,
      "appointementmodel": a
    });
  }

  feedBack(String doctorid, String comment, String rating,
      String appointementid) async {
    statusRequest = StatusRequest.loading;
    update();
    doctorid = doctorid;
    var response = await feedbackData.postData(
        myServices.sharedPreferences.getString("id")!,
        doctorid,
        comment,
        rating);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        await deleteAppointement(doctorid, appointementid);

        await LoadDataCompleted();

        Get.defaultDialog(
            title: "Success",
            titleStyle: TextStyle(color: AppColor.red, fontSize: 18),
            middleText: "Thanks for your feedback !",
            middleTextStyle: TextStyle(fontWeight: FontWeight.w700));
        // isFeedback=true;
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  deleteAppointement(String doctorid, String appointementid) async {
    statusRequest = StatusRequest.loading;
    update();
    doctorid = doctorid;
    var response = await appointementData.deleteapp(
        myServices.sharedPreferences.getString("id")!,
        doctorid,
        appointementid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    LoadDataUpcoming();
    viewCancelled();
    LoadDataCompleted();
    super.onInit();
  }
}
