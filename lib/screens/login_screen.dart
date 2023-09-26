import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/screens/register_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/elevate_button.dart';
import '../components/text_button.dart';
import '../components/text_field.dart';
import '../controllers/login_controller.dart';
import '../utils/constance.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());
  final mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Image.asset("assets/images/khdne logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Form(
                key: mykey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "تسجيل الدخول",
                      // textDirection: TextDirection.rtl,
                      style: TextStyle(color: mainColor, fontSize: 20.sp),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: MyTextField(
                        controller: loginController.phoneController,
                        icon: Icons.phone,
                        hintText: "رقم الهاتف",
                      ),
                    ),
                    MyTextField(
                      controller: loginController.passwordController,
                      icon: Icons.lock,
                      hintText: "كلمة السر",
                      iconprefix: Icons.visibility_off_outlined,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "هل نسيت كلمة السر؟",
                      style: TextStyle(color: mainColor,
                      fontWeight:FontWeight.w700,
                      fontSize: 13.sp),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: elevate_button(
                  width: double.infinity,
                  height: 51.h,
                  text: "تسجيل الدخول",
                  function: () {
                    loginController.login();
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DefaultTextButton(
                      text: 'إنشاء حساب',
                      function: () {
                        Get.to(() => RegisterPage());
                      }),
                ),
                Text(
                  "ليس لديك حساب؟",
                  style: TextStyle(fontSize: 15.sp, color: mainColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
