import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constance.dart';


Widget DefaultTextButton({required String text,
required Function() function,int number=12
}){
  return TextButton(onPressed: function, child: Container(
  decoration: BoxDecoration(
      border: Border(
      bottom: BorderSide(
      color: Colors.red,  // Customize the line color here
      width: 1.0,          // Customize the line width here
  ),
  ),),
    child: Text(text,style: TextStyle(
      color: Colors.red,
      fontSize:ScreenUtil().setSp(15),
      fontWeight: FontWeight.bold
    ),),
  ));
}