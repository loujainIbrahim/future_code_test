import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/components/widget_image.dart';

import '../models/my_vehicle_model.dart';

Widget ItemListView(Vehicle vehicle) {
  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        //spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.0,
        ),borderRadius: BorderRadius.circular(30.r)),
    height: 193.h,
    width: 243.w,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 64.r,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(vehicle.color,
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Text(vehicle.model,
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${vehicle.boardNumber}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(vehicle.type.name,
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
