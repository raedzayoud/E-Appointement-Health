import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/controller/auth/login_controller.dart';
import 'package:health/core/class/handalingdataview.dart';
import 'package:health/core/constant/routes.dart';
import 'package:health/core/function/validinput.dart';
import 'package:health/view/widget/auth/curstomtextformauth.dart';
import 'package:health/view/widget/auth/custombuttonauth.dart';
import 'package:health/view/widget/auth/customsigninwithinternet.dart';
import 'package:health/view/widget/auth/customtextbodyauth.dart';
import 'package:health/view/widget/auth/logoauth.dart';
import '../../widget/auth/customtextsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(
        builder: (controllerImp) => HandlingdataRequest(
            statusRequest: controllerImp.statusRequest,
            widget: Scaffold(
              body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(
                          255, 118, 233, 128), // Start color (soft green)
                      Color.fromARGB(
                          255, 255, 255, 255), // Middle color (light)
                      Color.fromARGB(
                          255, 195, 235, 200), // End color (pastel green)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.2, 0.6, 1.0],
                  )), // Control the transition points

                  padding: EdgeInsets.only(top: 60, left: 40, right: 40),
                  child: Form(
                    key: controllerImp.formstate,
                    child: ListView(
                      children: [
                        Logoauth(),
                        Customtextbodyauth(
                          body:
                              "Our Platform offers the best booking system to enable you save time ",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Curstomtextformauth(
                          hintText: "Enter Your Email",
                          iconData: Icons.email_outlined,
                          label: "Email",
                          mycontroller: controllerImp.email,
                          validator: (val) {
                            return validinput(val!, 5, 100, "email");
                          },
                        ),
                        Curstomtextformauth(
                           obscturetext: controllerImp.isshowpassword,
                          hintText: "Enter Your Password",
                          label: "Password",
                          iconData: controllerImp.isshowpassword==true?Icons.visibility_off_outlined:Icons.visibility_outlined,
                          mycontroller: controllerImp.password,
                          validator: (val) {
                            return validinput(val!, 4, 100, "password");
                          },
                          onTapIcon: () {
                            controllerImp.showpassword();
                          },
                        ),
                        InkWell(
                          onTap: () {
                            //  controlllerImp.goToForgetPassword();
                          },
                          child: Text(
                            "Forget Password ?",
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Custombuttonauth(
                          content: "Sign In",
                          onPressed: () {
                            controllerImp.Login();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Customsigninwithinternet(),
                        SizedBox(
                          height: 17,
                        ),
                        Customtextsignup(
                          textone: "Don't have an account ? ",
                          textwo: "Sign up ",
                          onTap: () {
                            // controlllerImp.goToSignup();
                            Get.offAllNamed(AppRoutes.singup);
                          },
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
