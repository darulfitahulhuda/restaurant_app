part of 'models.dart';

class ListRestaurantResult {
  ListRestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  factory ListRestaurantResult.fromJson(Map<String, dynamic> json) =>
      ListRestaurantResult(
          error: json["error"] ?? null,
          message: json["message"] ?? null,
          count: json["count"] ?? null,
          restaurants: List<Restaurant>.from(
              json['restaurants'].map((x) => Restaurant.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}
