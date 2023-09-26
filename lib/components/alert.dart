import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'elevate_button.dart';

void showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 10.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
           height: 250.h,
              width: 313.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(209.r), color: Colors.white,),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/amico.png"),
                    SizedBox(height: 16),
                    Text("طلبك قيد المراجعة"),
                    Text("سيتم اعلامك بالنتيجة"),
                  ],
                ),
              ),
            ),


              elevate_button(
                text: 'موافق',
                function: () {
                  Navigator.of(context).pop();
                },
              ),
            
          ],
        ),

      );
    },
  );
}
