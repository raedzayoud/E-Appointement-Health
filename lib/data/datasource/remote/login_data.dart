import 'dart:io';

import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  login(String email, String password) async {
    var response = await crud
        .postData(AppLinkApi.login, {"email": email, "password": password});

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
