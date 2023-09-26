class TypeModel {
  int id;
  String name;

  TypeModel({required this.id, required this.name});

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class TypesResponse {
  String status;
  List<TypeModel> data;

  TypesResponse({required this.status, required this.data});

  factory TypesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List<dynamic>;
    List<TypeModel> types =
    list.map((type) => TypeModel.fromJson(type)).toList();

    return TypesResponse(
      status: json['status'],
      data: types,
    );
  }
}