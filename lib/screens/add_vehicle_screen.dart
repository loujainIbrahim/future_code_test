import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_code_test/components/elevate_button.dart';
import 'package:get/get.dart';

import '../components/text_field.dart';
import '../controllers/add_vehicle_controller.dart';
import '../models/type_model.dart';
import 'dart:io';

import '../utils/constance.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final AddVehicleController controller = Get.put(AddVehicleController());
  List<String> colors = ["أسود", "أبيض", "أحمر", "أزرق"];

  @override
  void initState() {
    super.initState();
    controller.fetchVehicleTypes();
  }

  void _showImagePickerDialog(ImageType imageType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an Image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () async {
                    await controller.selectImage(controller);
                    Navigator.of(context).pop();
                  },
                ),
                // Add more options like Camera if needed
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSelectedImagesList() {
    return Obx(() {
      if (controller.selectedImages.isEmpty) {
        return Center(
          child: Text(''),
        );
      } else {
        return Container(
          height: MediaQuery.of(context).size.height / 6,
// width: 150.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.selectedImages.length,
            itemBuilder: (context, index) {
              final imageFile = controller.selectedImages[index];
              return Container(
                height: MediaQuery.of(context).size.height / 6,
                width: 150.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: MediaQuery.of(context).size.height / 6,
                      child: Stack(
                        children: [
                          Container(
                            width: 150.w,
                            height: MediaQuery.of(context).size.height / 6,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(7)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -15,
                            left: -12,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomRight: Radius.circular(5))),
                                  width: 40.w,
                                  height: 30.h,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    controller.selectedImages.removeAt(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
// IconButton(
// icon: Icon(Icons.remove_circle),
// onPressed: () {
// controller.selectedImages.removeAt(index);
// },
// ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 12,
              );
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'إضافة مركبة',
          style: TextStyle(
              color: mainColor, fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(() {
                  if (controller.vehicleTypes.isEmpty) {
                    return CircularProgressIndicator();
                  } else {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField<TypeModel>(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xffEB6440),
                          ),
                        ),
                        isExpanded: true,
                        value: controller.selectedType,
                        hint: Text('نوع المركبة'),
                        onChanged: (newValue) {
                          setState(() {
                            controller.selectedType = newValue;
                          });
                        },
                        items: controller.vehicleTypes
                            .map<DropdownMenuItem<TypeModel>>(
                          (type) {
                            return DropdownMenuItem<TypeModel>(
                              value: type,
                              child: Text(type.name),
                            );
                          },
                        ).toList(),
                      ),
                    );
                  }
                }),
                MyTextField(
                  controller: controller.modelController,
                  hintText: 'الموديل',
                  icon: Icons.car_crash_sharp,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.book,
                        color: Color(0xffEB6440),
                      ),
                    ),
                    isExpanded: true,
                    value: controller.color,
                    hint: Text('لون المركبة'),
                    onChanged: (newValue) {
                      setState(() {
                        controller.color = newValue;
                      });
                    },
                    items: colors.map<DropdownMenuItem<String>>(
                      (color) {
                        return DropdownMenuItem<String>(
                          value: color,
                          child: Text(color),
                        );
                      },
                    ).toList(),
                  ),
                ),
                MyTextField(
                  controller: controller.boardNumberController,
                  hintText: "رقم اللوحة",
                  // iconprefix: Icons.outlined_food_bow
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " صور المركبة",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(" ١- صورة الميكانيك ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff747474))),
                Text("٢- صورة المركبة ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff747474))),
                Text("٣- صورة اللوحة",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff747474))),
                Text("٤- الهوية الشخصية ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff747474))),
                Text("٥- الوكالة أو التفويض",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff747474))),

                // Display the selected images
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        child: buildSelectedImagesList(),
                      ),
                      Container(
                        width: 100.w,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                _showImagePickerDialog(ImageType.vehicle);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.red,
                              ),
                            ),
                            Text("إضافة صورة"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: elevate_button(
                  text: "إضاقة مركبة",
                  function: () {
                    controller.addVehicle(context, controller);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
