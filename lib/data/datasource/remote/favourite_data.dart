import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class FavouriteData {
  Crud crud;

  FavouriteData(this.crud);

  addFavourite(String userid, String doctorid) async {
    var response = await crud.postData(
        AppLinkApi.addFavourite, {"userid": userid, "doctorid": doctorid});

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

  deleteFavourite(String userid, String doctorid) async {
    var response = await crud.postData(
        AppLinkApi.deleteFavourite, {"userid": userid, "doctorid": doctorid});

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

  viewFavourite(String userid) async {
    var response =
        await crud.postData(AppLinkApi.viewFavourite, {"userid": userid});

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
