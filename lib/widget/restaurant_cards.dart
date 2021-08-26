part of 'widgets.dart';

class RestaurantCards extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCards(
    this.restaurant, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.intentWithData(DetailRestoran.routeName, restaurant.id);
      },
      child: Container(
        height: 120,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        child: Row(
          children: [
            Hero(
              tag: restaurant.pictureUrl(),
              child: Container(
                height: 120,
                width: 120,
                margin: EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(restaurant.pictureUrl()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 6),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  RatingStars(restaurant.rating),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
