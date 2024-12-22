import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/constant/imageassets.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/data/datasource/remote/doctor_data.dart';
import 'package:health/data/model/doctormodel.dart';

class HomeController extends GetxController {
  Map<String, IconData> mp = {
    "General": FontAwesomeIcons.userDoctor,
    "Cardiology": FontAwesomeIcons
        .heartPulse, // Representing cardiology with a heart icon
    "Respiration":
        FontAwesomeIcons.lungs, // Representing respiration with an air icon
    "Dermatology": FontAwesomeIcons.hand,
    "Gynecology": FontAwesomeIcons.personPregnant,
    "Dental": FontAwesomeIcons.teeth,
  };
  List<Doctormodel> TopdataDoctor = [];
  StatusRequest statusRequest = StatusRequest.none;
  DoctorData doctorData = DoctorData(Get.find());
  Doctormodel? doctormodel;
  List<Doctormodel> searchlist = [];
  bool isSearch = false;
  TextEditingController searchdoctor = TextEditingController();
  //List ratingdoctor = [];

  void goToDoctorDetails(Doctormodel doctormodel) {
    Get.toNamed(AppRoutes.doctordetails,
        arguments: {"doctormodel": doctormodel});
  }

  void goToCategoriesDetails(String name, IconData icon) {
    Get.toNamed(AppRoutes.typecategories, arguments: {
      "icon": icon,
      "name": name,
    });
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    TopdataDoctor.clear();
    var response = await doctorData.postData();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
      
        print(data.first["doctor_rating"]);
        TopdataDoctor = data.map((e) => Doctormodel.fromJson(e)).toList();
     //   ratingdoctor.addAll(data2);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  searchDoctor() async {
    statusRequest = StatusRequest.loading;
    update();
    searchlist.clear();
    var response = await doctorData.searchDoctor(searchdoctor.text);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        searchlist = data.map((e) => Doctormodel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      statusRequest = StatusRequest.none;
    }
    update();
  }

  onSearchDoctor() {
    isSearch = true;
    searchDoctor();
    update();
  }

  @override
  void onInit() {
     getData();
    super.onInit();
  }
}
