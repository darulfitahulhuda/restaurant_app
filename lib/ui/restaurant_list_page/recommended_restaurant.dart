part of 'restaurant_list.dart';

class RecommendedRestaurant extends StatefulWidget {
  const RecommendedRestaurant({Key? key}) : super(key: key);

  @override
  _RecommendedRestaurantState createState() => _RecommendedRestaurantState();
}

class _RecommendedRestaurantState extends State<RecommendedRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(builder: (context, state, child) {
      if (state.state == ResultState.Loading) {
        return SafeArea(child: Center(child: CircularProgressIndicator()));
      } else if (state.state == ResultState.HasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultMargin),
            Text(
              'Recommended',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.recommended.length,
                itemBuilder: (context, index) {
                  return RecommendedCards(state.recommended[index]);
                },
              ),
            ),
          ],
        );
      } else if (state.state == ResultState.NoData) {
        return NoDataPage();
      } else if (state.state == ResultState.Error) {
        return ErrorPage(
          onPressed: () {
            setState(() {
              state.recommendedRestaurant();
              state.fetchAllRestaurant();
            });
          },
        );
      } else {
        return Center(
          child: Text(''),
        );
      }
    });
  }
}
