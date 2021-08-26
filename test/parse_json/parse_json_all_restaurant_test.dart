import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/model/models.dart';

import 'json.dart';

void main() {
  test('Test parsing json all Restaurant', () async {
    var result = ListRestaurantResult.fromJson(fetchAllJson);

    expect(result.error, false);
    expect(result.count, 20);
    expect(result.message, 'success');
  });
}
