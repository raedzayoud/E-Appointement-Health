import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitements_controller.dart';
import 'package:health/controller/comment_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/function/rating.dart';
import 'package:health/linkapi.dart';

class Completedappointement extends GetView<AppoitementsController> {
  const Completedappointement({super.key});

  @override
  Widget build(BuildContext context) {
    CommentController controller1 = Get.put(CommentController());
    return GetBuilder<AppoitementsController>(
      builder: (controller) {
        // Ensure the list is not empty
        if (controller.listcompleted.isEmpty) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "There is no any appointement Completed",
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
                itemCount: controller.listcompleted.length,
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
                                    "${AppLinkApi.imagesdoctor}/${controller.listcompleted[index].doctorImage}",
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
                                  "${controller.listcompleted[index].doctorUsername}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "${controller.listcompleted[index].doctorType}"),
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
                                "Date : ${controller.listcompleted[index].appointementDate}",
                                style: TextStyle(
                                  color: AppColor.primaycolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Time : ${controller.listcompleted[index].appointementHeure}",
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
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.primaycolor,
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.only(bottom: 20),
                          child: MaterialButton(
                            onPressed: () async {
                              rating(
                                  context,
                                  controller.listcompleted[index].doctorId
                                      .toString(),
                                  controller.listcompleted[index].appointementId
                                      .toString());

                              await controller1.loadComment(controller
                                  .listcompleted[index].doctorId
                                  .toString());
                            },
                            child: Text(
                              "Give us Your FeedBack of the doctor",
                              style: TextStyle(color: AppColor.white),
                            ),
                          ),
                        )
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
