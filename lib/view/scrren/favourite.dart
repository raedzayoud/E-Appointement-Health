import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:health/controller/favourite_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/linkapi.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController controller = Get.find();
    controller.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite Doctors",
          style: TextStyle(color: AppColor.white),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaycolor,
      ),
      body: GetBuilder<FavouriteController>(
          builder: (controller) => Container(
                child: controller.list.length == 0
                    ? Center(
                        child: Text(
                          "There is no Favourite Selected",
                          style: TextStyle(
                              color: AppColor.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              color: AppColor.white,
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag:
                                        'doctorImage_${controller.list[index].doctorUsername}',
                                    child: Container(
                                        height: 150,
                                        width: 120,
                                        padding: EdgeInsets.all(8),
                                        child: HashCachedImage(
                                          imageUrl:
                                              "${AppLinkApi.imagesdoctor}/${controller.list[index].doctorImage}",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "Dr." +
                                                controller.list[index]
                                                    .doctorUsername!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(controller
                                              .list[index].doctorType!),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 20),
                                                    child: Text(
                                                      controller.list[index]
                                                                  .doctorRating !=
                                                              0.00
                                                          ? controller
                                                              .list[index]
                                                              .doctorRating!.toStringAsFixed(
                                                                  2)
                                                          : "N/A",
                                                    ),
                                                  ),
                                                  Icon(Icons.star,
                                                      color: Colors.yellow),
                                                ],
                                              ),
                                            ),
                                            Text(
                                                "Reviews (${controller.list[index].doctorReview})"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
              )),
    );
  }
}
