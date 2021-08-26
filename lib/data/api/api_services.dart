import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:restaurant_app/data/model/models.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String baseImageUrl =
      'https://restaurant-api.dicoding.dev/images/medium/';

  Future<ListRestaurantResult> list() async {
    final result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      var url = _baseUrl + 'list';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = ListRestaurantResult.fromJson(json.decode(response.body));

        return data;
      } else {
        throw Exception('Failed to load restaurant list');
      }
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<DetailRestaurantResult> detail(String id) async {
    final result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      var url = _baseUrl + 'detail/$id';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = DetailRestaurantResult.fromJson(json.decode(response.body));

        return data;
      } else {
        throw Exception('Failed to restaurant detail');
      }
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<ListRestaurantResult> search(String query) async {
    final result = await InternetConnectionChecker().hasConnection;

    var url = _baseUrl + 'search?q=$query';

    if (result == true) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = ListRestaurantResult.fromJson(json.decode(response.body));
        return data;
      } else {
        throw Exception('Failed to load restaurant list');
      }
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<CustomerReviewResult> createReview(String id, String review) async {
    final result = await InternetConnectionChecker().hasConnection;

    var url = _baseUrl + 'review';
    var name = 'Darul';

    if (result == true) {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-Auth-Token': '12345',
        },
        body: jsonEncode(<String, String>{
          'id': id,
          'name': name,
          'review': review,
        }),
      );

      if (response.statusCode == 200) {
        return CustomerReviewResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to save review');
      }
    } else {
      throw Exception('No internet connection');
    }
  }
}
