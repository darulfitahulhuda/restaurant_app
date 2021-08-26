part of 'details.dart';

class FavoriteButton extends StatelessWidget {
  final Restaurant restaurant;
  const FavoriteButton({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isFavorite(restaurant.id),
        builder: (context, snapshot) {
          bool isFavorite = snapshot.data ?? false;
          return isFavorite
              ? IconButton(
                  onPressed: () {
                    provider.removeFavorite(restaurant.id);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: secondaryColor,
                  ))
              : IconButton(
                  onPressed: () {
                    provider.addFavorites(restaurant);
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ));
        },
      );
    });
  }
}
