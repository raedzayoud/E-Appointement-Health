import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitementsdoctor_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/view/scrren/appointement/timeselectionpagedoctor.dart';
import 'package:health/view/widget/appointementdoctor/customappar.dart';
import 'package:table_calendar/table_calendar.dart';

class Appointementsdoctor extends StatelessWidget {
  const Appointementsdoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppoitementsdoctorController());
    return GetBuilder<AppoitementsdoctorController>(
        builder: (controller) => Scaffold(
              appBar: Customappar(
                name: "Appointement",
              ),
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Please choose a day, and the app will show you the available times for this doctor.",
                      style: TextStyle(color: AppColor.black,fontWeight: FontWeight.bold,fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    // Calendar Widget
                    Container(
                      margin: EdgeInsets.only(top: Get.width / 4.8),
                      alignment: Alignment.center,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCalendar(
                            firstDay: DateTime.utc(2020, 1, 1),
                            lastDay: DateTime.utc(2030, 12, 31),
                            focusedDay: controller.focusedDay!,
                            selectedDayPredicate: (day) =>
                                isSameDay(controller.selectedDay, day),
                            onDaySelected: (selectedDay, focusedDay) {
                              controller.onDaySelected(selectedDay, focusedDay);
                              if (selectedDay.weekday != DateTime.saturday &&
                                  selectedDay.weekday != DateTime.sunday) {
                                // Navigate to the time selection page
                                Get.to(
                                    () => Timeselectionpagedoctor(
                                          selectedDate: selectedDay,
                                          timeSlots: controller.timeSlots,
                                        ),
                                    arguments: {
                                      "doctorid": controller
                                          .doctormodel!.doctorId
                                          .toString(),
                                      "appointementdate":
                                          controller.selectedDay.toString(),
                                      "doctormodel": controller.doctormodel,
                                      "selectedDay": controller.selectedDay,
                                      "focusedDay": controller.focusedDay,
                                    });
                              }
                            },
                            enabledDayPredicate: (day) {
                              return day.isAfter(DateTime.now()
                                  .subtract(const Duration(days: 1)));
                            },
                            calendarFormat: CalendarFormat.month,
                            calendarBuilders: CalendarBuilders(
                              selectedBuilder: (context, date, _) {
                                return Container(
                                  margin: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${date.day}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    if (controller.selectedDay.weekday == DateTime.saturday ||
                        controller.selectedDay.weekday == DateTime.sunday) ...[
                      Expanded(
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: Get.width / 2,
                            child: Text(
                              "There are no appointments on these days",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ));
  }
}
