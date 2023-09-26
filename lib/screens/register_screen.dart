import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/utils/constance.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/elevate_button.dart';
import '../components/text_button.dart';
import '../components/text_field.dart';
import '../controllers/register_controller.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _registerController = Get.put(RegisterController());
 final mykey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: mainColor,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/khdne logo.png"),
            ),
            Expanded(
              flex: 12,
              child: Form(
                key:mykey ,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "إنشاء حساب",
                      // textDirection: TextDirection.rtl,
                      style: TextStyle(color: mainColor, fontSize: 20.sp),
                    ),
                    MyTextField(
                      controller: _registerController.fullNameController,
                      icon: Icons.person,
                      hintText: "الاسم",
                    ),
                    MyTextField(
                      controller: _registerController.phoneNumberController,
                      icon: Icons.phone,
                      hintText: "رقم الهاتف",
                    ),
                    MyTextField(
                      controller: _registerController.passwordController,
                      icon: Icons.lock,
                      hintText: "كلمة السر",
                      iconprefix: Icons.visibility_off_outlined,
                    ),
                    MyTextField(
                      controller: _registerController.confirmPasswordController,
                      icon: Icons.lock,
                      hintText: "تأكيد كلمة السر",
                      iconprefix: Icons.visibility_off_outlined,
                    ),

                    SizedBox(height: 16.0),
                    elevate_button(
                        width: double.infinity,
                        height: 51.h,
                        text: "إنشاء الحساب",
                        function: () {
                          _registerController.register();
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextButton(
                      text: 'تسجيل الدخول',
                      function: () {
                        Get.to(() => LoginPage());
                      }),
                  Text(
                    "هل لديك حساب؟",
                    style: TextStyle(fontSize: 15.sp, color: mainColor),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextButton(text: 'الشروط والأحكام', function: () {}),
                    Text(
                      "متابعتك تعني موافقتك على ",
                      style: TextStyle(fontSize: 14.sp, color: mainColor),
                    ),
                  ],
                ),
                DefaultTextButton(text: 'وسياسة الخصوصية', function: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
