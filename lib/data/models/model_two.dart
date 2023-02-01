import 'dart:convert';

CarModelTwo carModelOneFromJson(String str) => CarModelTwo.fromJson(json.decode(str));

String carModelOneToJson(CarModelTwo data) => json.encode(data.toJson());

class CarModelTwo {
  CarModelTwo({
    this.id,
    this.carModel,
    this.logo,
    this.establishedYear,
    this.averagePrice,
    this.description,
    required this.carPics,
  });

  int? id;
  String? carModel;
  String? logo;
  int? establishedYear;
  int? averagePrice;
  String? description;
  List<String> carPics;

  factory CarModelTwo.fromJson(Map<String, dynamic> json) => CarModelTwo(
    id: json["id"],
    carModel: json["car_model"],
    logo: json["logo"],
    establishedYear: json["established_year"],
    averagePrice: json["average_price"],
    description: json["description"],
    carPics: List<String>.from(json["car_pics"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_model": carModel,
    "logo": logo,
    "established_year": establishedYear,
    "average_price": averagePrice,
    "description": description,
    "car_pics": List<dynamic>.from(carPics.map((x) => x)),
  };
}
