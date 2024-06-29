// To parse this JSON data, do
//
//     final menuResponse = menuResponseFromJson(jsonString);

import 'dart:convert';

MenuResponse menuResponseFromJson(String str) => MenuResponse.fromJson(json.decode(str));

String menuResponseToJson(MenuResponse data) => json.encode(data.toJson());

class MenuResponse {
  List<Menu>? menu;
  int? vat;
  String? note;

  MenuResponse({
    this.menu,
    this.vat,
    this.note,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) => MenuResponse(
    menu: json["menu"] == null ? [] : List<Menu>.from(json["menu"]!.map((x) => Menu.fromJson(x))),
    vat: json["vat"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "menu": menu == null ? [] : List<dynamic>.from(menu!.map((x) => x.toJson())),
    "vat": vat,
    "note": note,
  };
}

class Menu {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? description;
  int? price;
  int? discountPrice;

  Menu({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.description,
    this.price,
    this.discountPrice,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    description: json["description"],
    price: json["price"],
    discountPrice: json["discount_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "description": description,
    "price": price,
    "discount_price": discountPrice,
  };
}
