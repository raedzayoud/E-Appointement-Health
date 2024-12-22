import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/profileinfo_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/imageassets.dart';

class Profileinfo extends StatelessWidget {
  const Profileinfo({super.key});

  @override
  Widget build(BuildContext context) {
  ProfileinfoController controller=  Get.put(ProfileinfoController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: AppColor.white, fontSize: 25),
          
        ),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: AppColor.white,)),
        centerTitle: true,
        backgroundColor: AppColor.primaycolor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: 150,
                width: 150,
                child: Image.asset(AppImageassets.person)),
            SizedBox(
              height: 60,
            ),
            Text(
              "${controller.username}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email : "),
                    Text("${controller.email}")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Telephone : "), Text("+216 ${controller.telephone}")],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Age : "), Text("${controller.age} years old")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
