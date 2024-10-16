import 'dart:convert';

Cows cowsFromJson(String str) => Cows.fromJson(json.decode(str));

String cowsToJson(Cows data) => json.encode(data.toJson());

class Cows {
  List<Product> products;
  Status status;

  Cows({
    required this.products,
    required this.status,
  });

  factory Cows.fromJson(Map<String, dynamic> json) => Cows(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "status": status.toJson(),
      };
}

class Product {
  Category category;
  String? description;
  int id;
  String img;
  String location;
  String name;
  int price;
  double stars;
  int totalRate;
  String? decription;

  Product({
    required this.category,
    this.description,
    required this.id,
    required this.img,
    required this.location,
    required this.name,
    required this.price,
    required this.stars,
    required this.totalRate,
    this.decription,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        category: categoryValues.map[json["category"]]!,
        description: json["description"],
        id: json["id"],
        img: json["img"],
        location: json["location"],
        name: json["name"],
        price: json["price"],
        stars: json["stars"]?.toDouble(),
        totalRate: json["totalRate"],
        decription: json["decription"],
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "description": description,
        "id": id,
        "img": img,
        "location": location,
        "name": name,
        "price": price,
        "stars": stars,
        "totalRate": totalRate,
        "decription": decription,
      };
}

enum Category { DOMBA, KAMBING, SAPI }

final categoryValues = EnumValues({
  "Domba": Category.DOMBA,
  "Kambing": Category.KAMBING,
  "Sapi": Category.SAPI
});

class Status {
  int status;

  Status({
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
