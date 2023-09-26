import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/utils/constance.dart';


Widget elevate_button({
   Color? backround,
  double width = 238,
  double height = 54,
  double radius = 25.0,
  Color? textColor,
  double fontSizeText = 18,
  required String text,
  required Function() function,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(ScreenUtil().setWidth(width),
            ScreenUtil().setHeight(height)), // set the minimum size
        primary:mainColor , // set the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              25.0), // set the border radius
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSizeText, color: textColor),
      ),
    ),
  );
}