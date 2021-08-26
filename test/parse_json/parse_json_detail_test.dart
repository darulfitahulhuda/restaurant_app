import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/model/models.dart';

import 'json.dart';

void main() {
  test('Test parsing json detail Restaurant', () async {
    var restaurant = ListRestaurantResult.fromJson(fetchAllJson);
    var result = restaurant.restaurants
        .where((restaurant) => restaurant.name == 'Melting Pot');

    var dr = DetailRestaurantResult.fromJson(detailResotarant);

    expect(dr.restaurants.id == result.first.id, true);
    expect(dr.restaurants.name == result.first.name, true);
    expect(dr.restaurants.city == result.first.city, true);
    expect(dr.restaurants.pictureId == result.first.pictureId, true);
    expect(dr.restaurants.rating == result.first.rating, true);
  });
}
