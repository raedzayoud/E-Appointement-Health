import 'package:get/get.dart';

class ProfileinfoController extends GetxController{
  
  String username="";
  String age="";
  String telephone="";
  String email="";
  
  
  @override
  void onInit() {
    username=Get.arguments["username"];
    age=Get.arguments["Age"];
    telephone=Get.arguments["Telephone"];
    email=Get.arguments["Email"];
    super.onInit();
  }
}