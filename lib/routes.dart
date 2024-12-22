import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:health/core/middleware/mymiddle.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/view/scrren/appointement/appointementsdoctor.dart';
import 'package:health/view/scrren/auth/login.dart';
import 'package:health/view/scrren/auth/signup.dart';
import 'package:health/view/scrren/comment.dart';
import 'package:health/view/scrren/doctordetails.dart';
import 'package:health/view/scrren/home.dart';
import 'package:health/view/scrren/homescrren.dart';
import 'package:health/view/scrren/appointement/recheduleappointement.dart';
import 'package:health/view/scrren/profile/profileinfo.dart';
import 'package:health/view/scrren/successappointement.dart';
import 'package:health/view/scrren/typecategories.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => Login(), middlewares: [Mymiddleware()]),
  //GetPage(name: "/", page: () => Profileinfo()),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.singup, page: () => Singup()),
  GetPage(name: AppRoutes.home, page: () => Home()),
  GetPage(name: AppRoutes.homescrren, page: () => Homescrren()),
  GetPage(name: AppRoutes.doctordetails, page: () => Doctordetails()),
  GetPage(
      name: AppRoutes.appoitementsSchedule, page: () => Appointementsdoctor()),
  GetPage(name: AppRoutes.typecategories, page: () => Typecategories()),
  GetPage(name: AppRoutes.comment, page: () => Comment()),
  GetPage(name: AppRoutes.profileinfo, page: () => Profileinfo()),
  GetPage(
      name: AppRoutes.successappointement, page: () => Successappointement()),

  GetPage(
      name: AppRoutes.recheduleappointement,
      page: () => Recheduleappointement()),
  //  GetPage(name: "/", page: () => Test()),
];
