import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../models/my_vehicle_model.dart';
import '../utils/constance.dart';

class VehiclesController extends GetxController {
  RxList<Vehicle> vehicles = <Vehicle>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchVehicles();
  }

  Future<void> fetchVehicles() async {
    print("token $token");
    final response = await http.get(
        Uri.parse('http://taskflutter.futurecode-projects.com/api/Vehicle'),
      headers: {'Authorization': 'Bearer $token'},
        );

    if (response.statusCode == 200) {
      print("vvvvvvv");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> vehicleListData = responseData['data'];
      final List<Vehicle> vehicleList =
          vehicleListData.map((data) => Vehicle.fromJson(data)).toList();
      vehicles.value = vehicleList;
    } else {
      print(response.body);
      // Handle the error case
    }
  }
}
