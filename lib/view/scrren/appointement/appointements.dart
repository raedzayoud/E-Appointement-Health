import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitements_controller.dart';
import 'package:health/core/class/handalingdataview.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/view/widget/appointement/cancelled.dart';
import 'package:health/view/widget/appointement/completedappointement.dart';
import 'package:health/view/widget/appointement/customtype.dart';
import 'package:health/view/widget/appointement/typeappointementborder.dart';

class Appointements extends StatelessWidget {
  const Appointements({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppoitementsController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Appointements Schedule ",
            style: TextStyle(color: AppColor.white),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaycolor,
        ),
        body: GetBuilder<AppoitementsController>(
            builder: (controller) => HandlingdataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    color: AppColor.white,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          
                          child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Customtype(
                              type: "Upcoming",
                            ),
                            Customtype(
                              type: "Completed",
                            ),
                            Customtype(
                              type: "Cancelled",
                            ),
                          ]),
                        ),
                        getTabContent(controller.type, controller),
                      ],
                    ),
                  ),
                )));
  }
}

Widget getTabContent(String type, AppoitementsController controller) {
  if (type == "Upcoming") {
    return Typeappointementborder();
  } else if (type == "Completed") {
    return Completedappointement();
  } else {
    return Cancelled();
  }
}
