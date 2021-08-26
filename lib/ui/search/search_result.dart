part of 'search.dart';

class SearchResult extends StatefulWidget {
  final String query;
  const SearchResult({Key? key, required this.query}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<RestaurantsProvider>().searchRestaurants(widget.query));
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Consumer<RestaurantsProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        return widget.query.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: state.result.restaurants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, DetailRestoran.routeName,
                            arguments: state.result.restaurants[index]);
                      },
                      child: RestaurantCards(state.result.restaurants[index]));
                })
            : state.query.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: state.result.restaurants.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, DetailRestoran.routeName,
                                arguments: state.result.restaurants[index]);
                          },
                          child:
                              RestaurantCards(state.result.restaurants[index]));
                    })
                : ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: state.result.restaurants.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, DetailRestoran.routeName,
                                arguments: state.result.restaurants[index]);
                          },
                          child:
                              RestaurantCards(state.result.restaurants[index]));
                    });
      } else if (state.state == ResultState.NoData) {
        return NoDataPage();
      } else if (state.state == ResultState.Error) {
        return Center(
            child: ErrorPage(
          backToHomePage: true,
          onPressed: () {
            setState(() {
              state.searchRestaurants(state.query);
            });
          },
        ));
      } else {
        return Center(child: Text(''));
      }
    });
  }
}
