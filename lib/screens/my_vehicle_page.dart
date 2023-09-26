import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/components/item_list_view.dart';
import 'package:future_code_test/utils/constance.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../components/elevate_button.dart';
import '../controllers/add_vehicle_controller.dart';
import '../controllers/my_vehicle_controller.dart';
import 'add_vehicle_screen.dart';

class VehiclesPage extends StatelessWidget {
  final VehiclesController vehiclesController = Get.put(VehiclesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: elevate_button(text: 'إضافة مركبة', function: () {
          Get.to(()=>AddVehicleScreen());
        }),
       // floating: true,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: mainColor,
              )),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'مركباتي',
          style: TextStyle(
              color: mainColor, fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
      ),
      body: Obx(
        () {
          if (vehiclesController.vehicles.isEmpty) {
            // print(vehiclesController.vehicles.length);
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemCount: vehiclesController.vehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = vehiclesController.vehicles[index];
                  return ItemListView(vehicle);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
