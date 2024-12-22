class AppLinkApi {
  static String linkServeurName = "http://192.168.125.179/health";
  //

  //===================================Image===================================//

  static String imagesdoctor = "$linkServeurName/upload/doctor";
  static String imagesuser = "$linkServeurName/upload/users";
  // doctor
  static String viewdoctor = "$linkServeurName/doctor/viewdoctorbyreview.php";
  static String searchdoctor = "$linkServeurName/doctor/searchdoctor.php";
  static String filtragebyspec =
      "$linkServeurName/doctor/filtragebyspeacilte.php";

  //signup
  static String signup = "$linkServeurName/auth/signup.php";
  static String login = "$linkServeurName/auth/login.php";

  //appointement

  static String addappointement = "$linkServeurName/appointement/add.php";
  static String viewappointement =
      "$linkServeurName/appointement/viewupcoming.php";
  static String cancelledapp = "$linkServeurName/appointement/cancelledapp.php";
  static String viewcancelled =
      "$linkServeurName/appointement/viewcancelled.php";
  static String completedapp = "$linkServeurName/appointement/completedapp.php";
  static String viewcompletedapp =
      "$linkServeurName/appointement/viewcompleted.php";
  static String timemanager = "$linkServeurName/appointement/timemanager.php";
  static String recheduleappointement =
      "$linkServeurName/appointement/recheduleappointement.php";
  static String feedback = "$linkServeurName/appointement/feedback.php";
  static String deleteAppointement =
      "$linkServeurName/appointement/deleteapp.php";

//favourite
  static String addFavourite = "$linkServeurName/favourite/add.php";
  static String deleteFavourite = "$linkServeurName/favourite/delete.php";
  static String viewFavourite = "$linkServeurName/favourite/view.php";

  //comment
  static String viewComment = "$linkServeurName/comment/view.php";
  static String getetoileachdoctorfromcomment = "$linkServeurName/comment/getetoileachdoctor.php";
}
