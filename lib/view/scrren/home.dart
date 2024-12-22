import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/home_controller.dart';
import 'package:health/core/class/handalingdataview.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/imageassets.dart';
import 'package:health/linkapi.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:health/view/widget/home/customtextformfieldsearch.dart';
import 'package:health/view/widget/home/listdoctorsearch.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(HomeController());
    //controller.getData();
    return GetBuilder<HomeController>(
        builder: (controller) => HandlingdataRequest(
              statusRequest: controller.statusRequest,
              widget: Scaffold(
                body: RefreshIndicator(
                  onRefresh: ()=>controller.getData(),
                  child: Container(
                    color: AppColor.white,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Search for your favourite doctor",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        SizedBox(height: 10),
                        Customtextformfieldsearch(
                          controller: controller.searchdoctor,
                          hintText: "Search for your doctor",
                          iconData: Icons.search,
                          onPressed: () {
                            controller.onSearchDoctor();
                          },
                          validator: (value) {},
                          onChanged: (val) {
                            controller.checkSearch(val);
                          },
                        ),
                        SizedBox(height: 20),
                        HandlingdataRequest(
                            statusRequest: controller.statusRequest,
                            widget: controller.isSearch == false
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.primaycolor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        height: 200,
                                        width: double.infinity, // Use full width
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: Transform.scale(
                                                scale:
                                                    3.5, // Adjust scale as needed
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    AppImageassets.secondlogo,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Welcome to Dawini! The best book appointments \n with trusted doctors quickly and easily.",
                                              style: TextStyle(
                                                color: AppColor.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Categories",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 50,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.mp.length,
                                          itemBuilder: (context, index) {
                                            String category = controller.mp.keys
                                                .elementAt(index);
                                            IconData icon =
                                                controller.mp[category]!;
                                            return InkWell(
                                              onTap: () {
                                                controller.goToCategoriesDetails(
                                                    category, icon);
                                              },
                                              child: Container(
                                                width: 150,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                decoration: BoxDecoration(
                                                  color: AppColor.primaycolor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 15),
                                                    Icon(icon,
                                                        size: 30,
                                                        color: AppColor.white),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      category,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: AppColor.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Top Doctor",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                      SizedBox(height: 10),
                                      ...List.generate(
                                          controller.TopdataDoctor.length,
                                          (index) {
                                        final doctor =
                                            controller.TopdataDoctor[index];
                                        return InkWell(
                                          onTap: () {
                                            controller.goToDoctorDetails(doctor);
                                          },
                                          child: Card(
                                            color: AppColor.white,
                                            margin:
                                                EdgeInsets.symmetric(vertical: 5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Hero(
                                                  tag:
                                                      'doctorImage_${doctor.doctorUsername}',
                                                  child: Container(
                                                      height: 150,
                                                      width: 120,
                                                      padding: EdgeInsets.all(8),
                                                      child: HashCachedImage(
                                                        imageUrl:
                                                            "${AppLinkApi.imagesdoctor}/${doctor.doctorImage}",
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
                                                          "Dr. ${doctor.doctorUsername}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        subtitle: Text(
                                                            doctor.doctorType!),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(left: 20),
                                                                  child: Text(
                                                                    doctor.doctorRating !=
                                                                            0.00
                                                                        ? doctor
                                                                            .doctorRating!
                                                                            .toStringAsFixed(
                                                                                2)
                                                                        : "N/A",
                                                                  ),
                                                                ),
                                                                Icon(Icons.star,
                                                                    color: Colors
                                                                        .yellow),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                              "Reviews (${doctor.doctorReview})"),
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
                                    ],
                                  )
                                : ListDoctorSearch(
                                    doctormodel: controller.searchlist))
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
