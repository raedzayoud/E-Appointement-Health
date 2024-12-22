import 'package:flutter/material.dart';
import 'package:health/core/class/statusrequest.dart';
import 'package:health/core/constant/color.dart';
import 'package:health/core/constant/imageassets.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie/lottie.dart' as lottie;
class Handlingdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdataview(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageassets.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.failed
            ? Center(
                child: Lottie.asset(AppImageassets.nodata,
                    width: 250, height: 250),
              )
            : statusRequest == StatusRequest.offlinefailure
                ? Center(
                    child: Lottie.asset(AppImageassets.nointernet,
                        width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.serverfailure
                    ? Center(
                        child: Lottie.asset(AppImageassets.serverfailed,
                            width: 250, height: 250),
                      )
                    : widget;
  }
}

class HandlingdataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingdataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(
          AppImageassets.loading,
          width: 250,
          height: 250,
          delegates: lottie.LottieDelegates(
            values: [
              ValueDelegate.color(
                const ['**'], 
                value: AppColor.primaycolor,
              ),
            ],
          ),
        ),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child: Lottie.asset(AppImageassets.nointernet, width: 250, height: 250),
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child:
            Lottie.asset(AppImageassets.serverfailed, width: 250, height: 250),
      );
    } else {
      return widget;
    }
  }
}