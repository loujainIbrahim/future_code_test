import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/screens/onboarding_screens/screen_2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/constance.dart';
import '../register_screen.dart';

class Screen_3 extends StatelessWidget {
  Screen_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100.w,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => RegisterPage());
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: mainColor,
              ))
        ],
        leading: TextButton(
          child: Text(
            "تخطي",
            style: TextStyle(color: mainColor, fontSize: 15.sp),
          ),
          onPressed: () {
            Get.to(() => Screen_2());
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Positioned(
                    left: -12,
                    right: 10,
                    bottom: -20,
                    top: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffEB6440).withOpacity(0.5)),
                      width: 173.w,
                      height: 50.h,
                    ),
                  ),
                  Text(
                    "كيف بيتم هالشي؟؟",
                    style: TextStyle(color: mainColor, fontSize: 24.sp),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                width: 290.w,
                height: 85.h,
                child: Text(
                  "كل يلي عليك تسجل دخول وتتمتع بالخدمة يلي عم نقدملك ياها مع تطبيقنا المميز خدني معك ",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  width: 300.w,
                  height: 310.74.h,
                  child: Image.asset(
                    "assets/images/img_2.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => RegisterPage());
                      },
                      child: Container(
                          width: 80.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xffEB6440).withOpacity(0.8)),
                          child: Center(
                            child: Text(
                              "يلا نبلش",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
