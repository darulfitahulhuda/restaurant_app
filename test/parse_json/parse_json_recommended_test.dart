import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/model/models.dart';

import 'json.dart';

void main() {
  test('Test parsing json recommended Restaurant', () async {
    var restaurant = ListRestaurantResult.fromJson(fetchAllJson);
    var result = restaurant.restaurants
        .where((restaurant) => restaurant.rating > 4.5)
        .toList();

    expect(result.length, 6);
    expect(result.first.name, 'Kafein');
  });
}
