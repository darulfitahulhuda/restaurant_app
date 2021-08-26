part of 'favorite.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      if (provider.state == ResultState.HasData) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: ListView.builder(
              itemCount: provider.restaurant.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigation.intentWithData(DetailRestoran.routeName,
                          provider.restaurant[index].id);
                    },
                    child:
                        FavoriteCard(restaurant: provider.restaurant[index]));
              }),
        );
      } else {
        return EmptyFavoritePage();
      }
    });
  }
}
