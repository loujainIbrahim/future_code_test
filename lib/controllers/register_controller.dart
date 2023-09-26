import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../screens/login_screen.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController imageController = TextEditingController();
   File? imageFile;

  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      print(imageFile);
    }
  }

  void register() async {

      final String fullName = fullNameController.text;
      final String phoneNumber = phoneNumberController.text;
      final String password = passwordController.text;
      final String confirmPassword = confirmPasswordController.text;


      final response = await http.post(
        Uri.parse(
            'http://taskflutter.futurecode-projects.com/api/register'), // Replace with your register API URL
        body: {
          'fullname': fullName,
          'phone_number': phoneNumber,
          'password': password,
          'password_confirmation': confirmPassword,
          'image': imageFile!= null? base64Encode(await imageFile!.readAsBytes()) : null,
        },
      );

      if (response.statusCode == 200) {
        // Registration successful
        print("success");
        Get.to(LoginPage());
        // Navigate to the Login page
      } else {
        print(response.body);
        // Registration failed
        Get.snackbar(
          'Registration Failed',
          'An error occurred during registration.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

