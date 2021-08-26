part of 'restaurant_list.dart';

class AllRestorant extends StatefulWidget {
  const AllRestorant({Key? key}) : super(key: key);

  @override
  _AllRestorantState createState() => _AllRestorantState();
}

class _AllRestorantState extends State<AllRestorant> {
  @override
  void initState() {
    super.initState();

    getInit();
  }

  getInit() async {
    await Provider.of<RestaurantsProvider>(context, listen: false)
        .fetchAllRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Consumer<RestaurantsProvider>(builder: (context, state, child) {
      if (state.state == ResultState.HasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultMargin),
            Text(
              'For You',
              style: Theme.of(context).textTheme.headline6,
            ),
            ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                return RestaurantCards(state.result.restaurants[index]);
              },
            ),
          ],
        );
      } else if (state.state == ResultState.NoData) {
        return Text('');
      } else if (state.state == ResultState.Error) {
        return Center(
          child: Text(''),
        );
      } else {
        return Center(
          child: Text(''),
        );
      }
    });
  }
}
