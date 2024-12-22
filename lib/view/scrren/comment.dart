import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/doctordetails_controller.dart';
import 'package:health/core/class/handalingdataview.dart';
import 'package:health/core/constant/color.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clients Comments",
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
        backgroundColor: AppColor.primaycolor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: GetBuilder<DoctordetailsController>(
        builder: (controller) => HandlingdataRequest(
          statusRequest: controller.statusRequest,
          widget: controller.list.isEmpty
              ? const Center(
                  child: Text(
                    "No comments available.",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.list.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${controller.list[index].usersUsername}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (starIndex) => Icon(
                                        Icons.star,
                                        color: starIndex <
                                                double.parse(controller
                                                    .list[index].commentRating!.toString())
                                            ? Colors.orange
                                            : Colors.grey[300],
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  controller.list[index].commentComment
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
