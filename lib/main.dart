import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/screens/add_photo_page.dart';
import 'package:future_code_test/screens/register_screen.dart';
import 'package:future_code_test/utils/cache_helper.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Registration App',
             theme: ThemeData(
            fontFamily: 'Somar', // Replace with your custom font family name
          ),
            initialRoute: '/photo', // Set RegisterPage as the initial route
            getPages: [
              GetPage(name: '/photo', page: () => AddPhotoPage()),
              GetPage(name: '/register', page: () => RegisterPage()),
              // Add other routes if needed
            ],
          ),
        );
      },
    );
  }
}
