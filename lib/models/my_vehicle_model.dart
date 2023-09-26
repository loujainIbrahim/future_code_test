class Vehicle {
  final int id;
  final int vehicleTypeId;
  final int userId;
  final String model;
  final String color;
  final int boardNumber;
  final String vehicleImage;
  final String mechanicImage;
  final String boardImage;
  final String idImage;
  final String delegateImage;
  final String createdAt;
  final String updatedAt;
  final VehicleType type;

  Vehicle({
    required this.id,
    required this.vehicleTypeId,
    required this.userId,
    required this.model,
    required this.color,
    required this.boardNumber,
    required this.vehicleImage,
    required this.mechanicImage,
    required this.boardImage,
    required this.idImage,
    required this.delegateImage,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      vehicleTypeId: json['vehicle_type_id'],
      userId: json['user_id'],
      model: json['model'],
      color: json['color'],
      boardNumber: json['board_number'],
      vehicleImage: json['vehicle_image'],
      mechanicImage: json['mechanic_image'],
      boardImage: json['board_image'],
      idImage: json['id_image'],
      delegateImage: json['delegate_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: VehicleType.fromJson(json['type']),
    );
  }
}

class VehicleType {
  final int id;
  final String name;

  VehicleType({
    required this.id,
    required this.name,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      id: json['id'],
      name: json['name'],
    );
  }
}