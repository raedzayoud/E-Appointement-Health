import 'dart:io';

import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  signup(Map<String, String> data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLinkApi.signup, data, file);

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }
}
