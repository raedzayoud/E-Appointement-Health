import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitementsdoctorReshedule_controller.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/view/scrren/appointement/timeselectionpage.dart';
import 'package:health/view/widget/appointementdoctor/customappar.dart';
import 'package:table_calendar/table_calendar.dart';

class Recheduleappointement extends StatelessWidget {
  const Recheduleappointement({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppoitementsdoctorresheduleController());
    return GetBuilder<AppoitementsdoctorresheduleController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
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
            "Reshedule Appointement",
            style: TextStyle(color: AppColor.white),
          ),
          centerTitle: true,
          // No actions if isAction is false
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Choose a date, and the page with available hours will appear.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),

              // Calendar Widget
              Container(
                margin: EdgeInsets.only(top: Get.width / 4.5),
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
                              () => TimeSelectionPage(
                                    selectedDate: selectedDay,
                                    timeSlots: controller.timeSlots,
                                  ),
                              arguments: {
                                "doctorid": controller.doctorid,
                                "appointementdate":
                                    controller.selectedDay.toString(),
                                "appointementmodel": controller.a
                              });
                        }
                      },
                      enabledDayPredicate: (day) {
                        return day.isAfter(
                            DateTime.now().subtract(const Duration(days: 1)));
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
              const SizedBox(height: 20),
              if (controller.selectedDay!.weekday == DateTime.saturday ||
                  controller.selectedDay!.weekday == DateTime.sunday)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outline, size: 50, color: Colors.red),
                        const SizedBox(height: 10),
                        const Text(
                          "There are no appointments on these days",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
