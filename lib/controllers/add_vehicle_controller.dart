import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../components/alert.dart';
import '../models/type_model.dart';
import '../utils/constance.dart';

class AddVehicleController extends GetxController {
  final TextEditingController boardNumberController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  TypeModel? selectedType;
  String? color;
  //List<TypeModel> vehicleTypes = [];
  RxList<TypeModel> vehicleTypes = <TypeModel>[].obs;
  final ImagePicker _imagePicker = ImagePicker();
  RxList<File> selectedImages = <File>[].obs;
  final vehicleImage = Rx<XFile?>(null);
  final boardImage = Rx<XFile?>(null);
  final idImage = Rx<XFile?>(null);
  final mechanicImage = Rx<XFile?>(null);
  final delegateImage = Rx<XFile?>(null);
  // File? vehicleImage;
  // File? boardImage;
  // File? idImage;
  // File? mechanicImage;
  // File? delegateImage;
  @override
  void onInit() {
    super.onInit();
    fetchVehicleTypes();
  }

  Future<void> selectImage(AddVehicleController controller) async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        controller.selectedImages.add(File(pickedImage.path));
      }
    } catch (e) {
      // Handle image selection error
    }
  }

  Future<void> fetchVehicleTypes() async {
    try {
      final response = await http.get(
        Uri.parse('http://taskflutter.futurecode-projects.com/api/VehicleType'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> typesvehicleListData = responseData['data'];
        final List<TypeModel> typevehicleList = typesvehicleListData
            .map((data) => TypeModel.fromJson(data))
            .toList();
        // final typesResponse = TypesResponse.fromJson(json.decode(response.body));
        vehicleTypes.value = typevehicleList;
      } else {
        throw Exception('Failed to fetch vehicle types');
      }
    } catch (e) {
      // Handle error while fetching vehicle types
    }
  }

  Future<void> addVehicle(BuildContext context, AddVehicleController controller) async {
    // Prepare the data to send to the API
    final Map<String, String> requestData = {
      'board_number': boardNumberController.text,
      'model': modelController.text,
      'color': color!,
      'vehicle_type_id': selectedType!.id!.toString(),
    };

    // Create a multipart request
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://taskflutter.futurecode-projects.com/api/Vehicle'),
    );

    // Add the token to the request headers
    request.headers['Authorization'] = 'Bearer $token';

    // Add the fields to the request
    requestData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Add the selected images to the request
    for (int i = 0; i < controller.selectedImages.length; i++) {
      final image = controller.selectedImages[i];
      final imageField = getImageField(i); // Get the field name based on the image index
      request.files.add(await http.MultipartFile.fromPath(
        imageField,
        image.path,
      ));
    }

    // Send the request
    final response = await request.send();

    if (response.statusCode == 200) {
      // Vehicle added successfully
      final successMessage = 'Vehicle added successfully.';
      // Display success message to the user
      showAlertDialog(context,"طلبك قيد المراجعة");
    } else {
      // Vehicle adding failed
      final errorMessage = 'Failed to add vehicle.';
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );

      // Print the raw error response
      final responseString = await response.stream.bytesToString();
      print('API Error Response: $responseString');
      print(response.statusCode);
    }
  }  String getImageField(int index) {
    switch (index) {
      case 0:
        return 'vehicle_image';
      case 1:
        return 'board_image';
      case 2:
        return 'id_image';
      case 3:
        return 'mechanic_image';
      case 4:
        return 'delegate_image';
      default:
        return 'image$index';
    }
  }
}

enum ImageType {
  vehicle,
  board,
  id,
  mechanic,
  delegate,
}
