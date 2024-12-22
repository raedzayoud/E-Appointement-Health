import 'package:get/get.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/function/handledata.dart';
import 'package:health/core/services/services.dart';
import 'package:health/data/datasource/remote/comment_data.dart';
import 'package:health/data/model/commentmodel.dart';
import 'package:health/data/model/doctormodel.dart';

class CommentController extends GetxController{

  Doctormodel? doctormodel;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  bool isFavourite = false;
  List<CommentModel> list = [];
  CommentData commentData = CommentData(Get.find());



   loadComment(String doctorid) async {
    statusRequest = StatusRequest.loading;
    update();
    list.clear();
    var response = await commentData.load(doctorid);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        list = data.map((e) => CommentModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }


}