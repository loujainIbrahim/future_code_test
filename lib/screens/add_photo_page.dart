import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/screens/register_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../components/elevate_button.dart';
import '../controllers/register_controller.dart';
import '../utils/constance.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/screens/register_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../components/elevate_button.dart';
import '../controllers/register_controller.dart';
import '../utils/constance.dart';

class AddPhotoPage extends StatelessWidget {
  const AddPhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/images/khdne logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "أضف صورتك الشخصية",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  "اجعل صورتك واضحة",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<RegisterController>(
                      init: RegisterController(),
                      builder: (controller) {
                        return controller.imageFile != null?Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 100.r,
                                  backgroundImage:
                                   FileImage(controller.imageFile!)
                                     ,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_circle_rounded,
                                  color: Color(0xffEB6440),
                                  size: 50.sp,
                                ),
                                onPressed: controller.selectImage,
                              ),
                            ),
                          ],
                        ):Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 100.r,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_circle_rounded,
                                  color: Color(0xffEB6440),
                                  size: 50.sp,
                                ),
                                onPressed: controller.selectImage,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    // elevate_button(
                    //   width: 20.w,
                    //   height: 20.h,
                    //   text: 'اختر صورة',
                    //   function: () {
                    //     Get.find<RegisterController>().selectImage();
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: elevate_button(
              text: "التالي",
              function: () {
                Get.to(
                  RegisterPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
