import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitements_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/linkapi.dart';

class Typeappointementborder extends GetView<AppoitementsController> {
  const Typeappointementborder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppoitementsController>(
      builder: (controller) {
        // Ensure the list is not empty
        if (controller.list.isEmpty) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "No appointments available",
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
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: 330,
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
                                    "${AppLinkApi.imagesdoctor}/${controller.list[index].doctorImage}",
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
                                  "${controller.list[index].doctorUsername}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "${controller.list[index].doctorType}"),
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
                                "Date : ${controller.list[index].appointementDate}",
                                style: TextStyle(
                                  color: AppColor.primaycolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Time : ${controller.list[index].appointementHeure}",
                                style: TextStyle(
                                  color: AppColor.primaycolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColor.secondcolor),
                              ),
                              margin: const EdgeInsets.only(bottom: 20),
                              child: MaterialButton(
                                onPressed: () async {
                                  await controller.CancelAppointement(
                                    controller.list[index].appointementId
                                        .toString(),
                                  );
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: AppColor.primaycolor),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              width: 120,
                              decoration: BoxDecoration(
                                color: AppColor.primaycolor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColor.primaycolor),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  controller.goToReschedule(
                                      controller.list[index].appointementDate
                                          .toString(),
                                      controller.list[index].appointementHeure
                                          .toString(),
                                      controller.list[index].appointementId
                                          .toString(),
                                      controller.list[index].doctorId
                                          .toString(),
                                      controller.list[index]);
                                },
                                child: Text(
                                  "Reschedule",
                                  style: TextStyle(color: AppColor.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColor.primaycolor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.primaycolor),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                             // controller.reloadHome();
                              await controller.isCompleted(
                                  controller.list[index].appointementDate!,
                                  controller.list[index].appointementHeure!,
                                  controller.list[index].appointementId
                                      .toString(),
                                  controller.list[index].doctorId.toString());
                            },
                            child: Text(
                              "Completed",
                              style: TextStyle(color: AppColor.white),
                            ),
                          ),
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
