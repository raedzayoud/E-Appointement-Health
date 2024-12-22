import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/typecategories_controller.dart';
import 'package:health/core/class/handalingdataview.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/view/widget/typecategoried/carddoctor.dart';
import 'package:health/view/widget/typecategoried/customappartypecategorie.dart';

class Typecategories extends StatelessWidget {
  const Typecategories({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(TypecategoriesController());

    return Scaffold(
      appBar: Customappartypecategorie(),
      body: GetBuilder<TypecategoriesController>(
        builder: (controller) {
          return HandlingdataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: AppColor.white,
              child: ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  final doctor = controller.list[index];
                  return Carddoctor(
                    doctor: doctor,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
