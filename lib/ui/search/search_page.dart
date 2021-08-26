part of 'search.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search_page';
  final String query;
  const SearchPage({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<RestaurantsProvider>(
        create: (context) => RestaurantsProvider(apiService: ApiService()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: SearchField(query: query),
                  ),
                  SearchResult(
                    query: query,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
