part of 'restaurant_list.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeNames = '/restorant_list_page';
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: ListView(
            children: [
              HeaderRestorant(),
              SearchRestorant(),
              RecommendedRestaurant(),
              AllRestorant(),
            ],
          ),
        ),
      ),
    );
  }
}
