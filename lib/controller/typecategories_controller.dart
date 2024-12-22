import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/data/datasource/remote/filtrage_data.dart';
import 'package:health/data/model/doctormodel.dart';

class TypecategoriesController extends GetxController {
  String name = "";
  IconData? icon; // Nullable in case the icon is not passed.
  StatusRequest statusRequest = StatusRequest.none;
  FiltrageData filtrageData = FiltrageData(Get.find());
  List<Doctormodel> list = [];

  @override
  void onInit() {
    super.onInit();

    // Safely retrieve arguments
    final arguments = Get.arguments ?? {};
    name = arguments['name'] ?? 'Category'; // Default to 'Category' if null
    icon = arguments['icon']; // Icon is nullable

    getDataByFiltrage(name);
  }

  getDataByFiltrage(String type) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await filtrageData.postData(type);
      statusRequest = HandleData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          List data = response['data'];
          list = data.map((e) => Doctormodel.fromJson(e)).toList();
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      statusRequest = StatusRequest.failed;
    }

    update();
  }
}
