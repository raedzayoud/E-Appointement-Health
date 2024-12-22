import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:health/controller/home_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/data/model/doctormodel.dart';
import 'package:health/linkapi.dart';

class ListDoctorSearch extends GetView<HomeController> {
  final List<Doctormodel> doctormodel;
  const ListDoctorSearch({super.key, required this.doctormodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: AppColor.white,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: doctormodel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToDoctorDetails(doctormodel[index]);
            },
            child: Card(
              color: AppColor.white,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    child: HashCachedImage(
                      imageUrl:
                          "${AppLinkApi.imagesdoctor}/${doctormodel[index].doctorImage}",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "Dr. ${doctormodel[index].doctorUsername}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(doctormodel[index].doctorType!),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(Icons.star, color: Colors.yellow),
                            ),
                            Text(
                                "Reviews (${doctormodel[index].doctorReview})"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
