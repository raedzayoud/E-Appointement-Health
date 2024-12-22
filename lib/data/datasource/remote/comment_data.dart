import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class CommentData {
  Crud crud;

  CommentData(this.crud);

  load(String doctorid) async {
    var response =
        await crud.postData(AppLinkApi.viewComment, {"doctorid": doctorid});
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
