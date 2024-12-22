import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/doctordetails_controller.dart';
import 'package:health/core/constant/color.dart';

class Customappar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final bool isAction;

  const Customappar({
    super.key,
    required this.name,
    this.isAction = false, // Default to no actions
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctordetailsController>(
        builder: (controller) => AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColor.white,
                ),
              ),
              backgroundColor: AppColor.primaycolor,
              title: Text(
                name,
                style: TextStyle(color: AppColor.white),
              ),
              centerTitle: true,
              actions: isAction
                  ? [
                      IconButton(
                        icon: Icon(
                            controller.isFavourite ==
                                    false
                                ? Icons.favorite_outline
                                : Icons.favorite,
                            color: AppColor.white),
                        onPressed: () {
                          controller.makeitFavourite(
                              controller.doctormodel!.doctorId.toString());
                        },
                      ),
                    ]
                  : null, // No actions if isAction is false
            ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
