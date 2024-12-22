import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitements_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/linkapi.dart';

class Cancelled extends GetView<AppoitementsController> {
  const Cancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppoitementsController>(
      builder: (controller) {
        // Ensure the list is not empty
        if (controller.listcancelled.isEmpty) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "There is no any appointement Cancelled",
                style: TextStyle(color: AppColor.red, fontSize: 18),
              ),
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                // Make ListView shrink to fit the content
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevent inner scrolling
                itemCount: controller.listcancelled.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Transform.scale(
                                scale: 0.8,
                                child: ClipOval(
                                  child: Image.network(
                                    "${AppLinkApi.imagesdoctor}/${controller.listcancelled[index].doctorImage}",
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.broken_image);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "${controller.listcancelled[index].doctorUsername}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "${controller.listcancelled[index].doctorType}"),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date : ${controller.listcancelled[index].appointementDate}",
                                style: TextStyle(
                                  color: AppColor.primaycolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Time : ${controller.listcancelled[index].appointementHeure}",
                                style: TextStyle(
                                  color: AppColor.primaycolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "This Appointement is Cancelled",
                          style: TextStyle(color: AppColor.red,fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
