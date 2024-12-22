import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class DoctorData {
  Crud crud;

  DoctorData(this.crud);

  postData() async {
    var response = await crud.postData(AppLinkApi.viewdoctor, {});
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
  
  searchDoctor(String name) async {
    var response = await crud.postData(AppLinkApi.searchdoctor, {
      "name":name
    });
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
