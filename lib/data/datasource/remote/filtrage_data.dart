import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class FiltrageData {
  Crud crud;

  FiltrageData(this.crud);

  postData(String type) async {
    var response =
        await crud.postData(AppLinkApi.filtragebyspec, {"type": type});
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
