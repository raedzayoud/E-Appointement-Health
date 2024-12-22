import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/binding.dart';
import 'package:health/core/services/services.dart';
import 'package:health/routes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialBinding: MyBinding(),
    );
  }
}
