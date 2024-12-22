import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/typecategories_controller.dart';
import 'package:health/core/constant/color.dart';

class Customappartypecategorie extends GetView<TypecategoriesController>
    implements PreferredSizeWidget {
  const Customappartypecategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaycolor,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColor.white,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.name,
            style: TextStyle(color: AppColor.white),
          ),
          if (controller.icon != null) ...[
            SizedBox(width: 5),
            Icon(
              controller.icon,
              color: AppColor.white,
            ),
          ],
          Container(margin: EdgeInsets.only(right: 40),)
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
