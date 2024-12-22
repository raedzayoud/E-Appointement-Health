import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/timeselectionpagedoctor_controller.dart';
import 'package:health/core/constant/color.dart';

class Timeselectionpagedoctor extends StatelessWidget {
  final DateTime selectedDate;
  final List<String> timeSlots;

  Timeselectionpagedoctor(
      {required this.selectedDate, required this.timeSlots});

  @override
  Widget build(BuildContext context) {
    Get.put(TimeselectionpagedoctorController());
    return GetBuilder<TimeselectionpagedoctorController>(
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
            "Select Consultation Time",
            style: TextStyle(color: AppColor.white),
          ),
          centerTitle: true,
          // No actions if isAction is false
        ),
        body: Container(
          color: AppColor.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Select Consultation Time',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      final time = timeSlots[index];

                      // Check if the time slot is already taken (exists in the list)
                      bool isTimeTaken = controller.list.any((appointment) =>
                          appointment.appointementHeure == time);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ChoiceChip(
                          label: Text(
                            time,
                            style: TextStyle(
                              color:
                                  isTimeTaken || controller.selectedTime == time
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                          selected: controller.selectedTime == time,
                          selectedColor: AppColor.primaycolor,
                          backgroundColor:
                              isTimeTaken ? Colors.grey : Colors.white,
                          onSelected: (selected) {
                            if (!isTimeTaken) {
                              controller.onTimeSelected(time);
                            } else {
                              // Optionally show a message when the time is already taken
                              Get.snackbar(
                                'Time Slot Unavailable',
                                'This time slot is already taken.',
                                backgroundColor: AppColor.black,
                                colorText: Colors.white,
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.primaycolor,
                      borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: () {
                      if (controller.selectedTime == null) {
                        Get.defaultDialog(
                            title: "Warning",
                            content: Text(
                                "Please choose a Time for the appointement "),
                            titleStyle: TextStyle(color: AppColor.red));
                        return;
                      }
                      controller.MakeAppointement(
                          controller.doctormodel!.doctorId.toString(),
                          controller.selectedDay,
                          controller.selectedTime!);
                    },
                    child: Text(
                      'Make Appointment',
                      style: TextStyle(color: AppColor.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}