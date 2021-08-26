part of 'models.dart';

class DetailRestaurantResult {
  DetailRestaurantResult({
    required this.error,
    required this.message,
    required this.restaurants,
  });

  bool error;
  String message;
  Restaurant restaurants;

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantResult(
          error: json["error"],
          message: json["message"],
          restaurants: Restaurant.fromJson(json['restaurant']));
}
