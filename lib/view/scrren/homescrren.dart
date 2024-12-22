import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/homescreen_controller.dart';
import 'package:health/core/constant/color.dart';

class Homescrren extends StatelessWidget {
  const Homescrren({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenController());
    return GetBuilder<HomescreenController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: BottomAppBar(
                color: AppColor.primaycolor,
                height: 70,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.changeindex(0);
                          },
                          icon: Icon(Icons.home,
                              color: 0 == controller.currentindex
                                  ? Colors.white
                                  : Colors.black)),
                      SizedBox(
                        width: 45,
                      ),
                      IconButton(
                          onPressed: () {
                            controller.changeindex(1);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: 1 == controller.currentindex
                                ? Colors.white
                                : Colors.black,
                          )),
                      SizedBox(
                        width: 45,
                      ),
                      IconButton(
                          onPressed: () {
                            controller.changeindex(2);
                          },
                          icon: Icon(
                            Icons.date_range,
                            color: 2 == controller.currentindex
                                ? Colors.white
                                : Colors.black,
                          )),
                      SizedBox(
                        width: 45,
                      ),
                      IconButton(
                          onPressed: () {
                            controller.changeindex(3);
                          },
                          icon: Icon(
                            Icons.person_2,
                            color: 3 == controller.currentindex
                                ? Colors.white
                                : Colors.black,
                          )),
                    ],
                  ),
                ),
                // Color of unselected items
              ),
              body: controller.list[controller.currentindex],
            ));
  }
}
