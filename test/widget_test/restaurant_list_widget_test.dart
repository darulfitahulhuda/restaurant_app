import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_services.dart';

import 'package:restaurant_app/provider/provider.dart';
import 'package:restaurant_app/ui/restaurant_list_page/restaurant_list.dart';

Widget createHomePage() => ChangeNotifierProvider(
      create: (_) => RestaurantsProvider(
        apiService: ApiService(),
      ),
      child: MaterialApp(
        home: RestaurantListPage(),
      ),
    );

void main() {
  group('Restaurant List Page Widget Test', () {
    testWidgets('testing if ListView shows up', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePage());
      await tester.pump(Duration(seconds: 40));
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Test Icon search', (WidgetTester tester) async {
      await tester.pumpWidget(createHomePage());
      await tester.pump(Duration(seconds: 40));

      expect(find.byIcon(Icons.search), findsOneWidget);
    });
  });
}
