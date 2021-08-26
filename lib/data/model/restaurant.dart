part of 'models.dart';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.address,
    required this.rating,
    required this.menus,
    required this.categories,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  String? address;
  double rating;
  Menus? menus;
  List<Category>? categories;
  List<CustomerReview>? customerReviews;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        address: json['address'] ?? null,
        rating: json["rating"].toDouble(),
        menus: json['menus'] != null ? Menus.fromJson(json['menus']) : null,
        categories: json["categories"] != null
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)))
            : null,
        customerReviews: json["customerReviews"] != null
            ? List<CustomerReview>.from(
                json["customerReviews"].map((x) => CustomerReview.fromJson(x)))
            : null,
      );

  String pictureUrl() => ApiService.baseImageUrl + this.pictureId;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
