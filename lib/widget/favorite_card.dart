part of 'widgets.dart';

class FavoriteCard extends StatelessWidget {
  final Restaurant restaurant;
  const FavoriteCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseProvider databaseProvider = Provider.of<DatabaseProvider>(context);
    return Container(
      height: 84,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12, 12, 20, 14),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Color(0xFF39374B), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Hero(
            tag: restaurant.pictureUrl(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                restaurant.pictureUrl(),
                height: 60,
                fit: BoxFit.cover,
                width: 60,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  restaurant.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: myTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: primaryColor),
                ),
                RatingStars(restaurant.rating),
              ],
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              databaseProvider.removeFavorite(restaurant.id);
            },
            icon: Icon(
              Icons.delete,
              color: alertColor,
            ),
          )
        ],
      ),
    );
  }
}
