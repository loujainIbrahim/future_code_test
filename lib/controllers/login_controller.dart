import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:future_code_test/screens/my_vehicle_page.dart';
import 'package:future_code_test/utils/constance.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../models/login_model.dart';
import '../utils/cache_helper.dart';
class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String phone = phoneController.text;
    final String password = passwordController.text;
   // final encodedPhone = utf8.encode(phone);
    final response = await http.post(
      Uri.parse('http://taskflutter.futurecode-projects.com/api/login'),
      body: {
        'phone_number': phone,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Login successful
      final responseData = LoginModel.fromJson(jsonDecode(response.body));
      print(responseData.data!.token);
      token=responseData.data!.token;
      CacheHelper.saveData(
          key: 'token',
          value: responseData.data!.token);
      print("success");
      Get.to(() => VehiclesPage());
      // Handle the response data as needed
    } else {
      // Login failed
      Get.snackbar(
        'Registration Failed',
        'An error occurred during registration.',
        snackPosition: SnackPosition.BOTTOM,
      );
      final errorMessage = response.body;
      print(errorMessage);
      // Handle the error message
    }
  }
}