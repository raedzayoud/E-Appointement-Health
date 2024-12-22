import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class FeedbackData {
  Crud crud;

  FeedbackData(this.crud);

  postData(
      String userid, String doctorid, String comment, String rating) async {
    var response = await crud.postData(AppLinkApi.feedback, {
      "userid": userid,
      "doctorid": doctorid,
      "comment": comment,
      "rating": rating
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
