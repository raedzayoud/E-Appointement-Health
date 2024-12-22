import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/appointement/appoitements_controller.dart';
import 'package:health/core/constant/imageassets.dart';
import 'package:rating_dialog/rating_dialog.dart';

void rating(
    BuildContext context, String doctorId, String appointmentId) async {
  final AppoitementsController appoitementsController = Get.find();
 

  // Create the Rating Dialog
  final _dialog = RatingDialog(
    initialRating: 1.0,
    title: const Text(
      '',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 0,
        fontWeight: FontWeight.bold,
      ),
    ),
    message: const Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    starSize: 34,
    image: Transform.scale(
      scale: 1.3,
      child: Image.asset(AppImageassets.secondlogo),
    ),
    submitButtonText: 'Submit',
    commentHint: 'Leave your feedback here...',
    onCancelled: () => print('Rating dialog cancelled'),
    onSubmitted: (response) async {
      // Log user response for debugging
      print('Rating: ${response.rating}, Comment: ${response.comment}');

      // Check user rating and handle accordingly
      if (response.rating < 3.0) {

           await appoitementsController.feedBack(
          doctorId,
          response.comment,
          response.rating.toString(),
          appointmentId,
        );
        
      } else {
         await appoitementsController.feedBack(
          doctorId,
          response.comment,
          response.rating.toString(),
          appointmentId,
        );
      
      }
    },
  );

  // Show the dialog
  showDialog(
    context: context,
    barrierDismissible: true, // Allow dismissal by tapping outside the dialog
    builder: (context) => _dialog,
  );
}
