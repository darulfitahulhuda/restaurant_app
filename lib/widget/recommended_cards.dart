part of 'widgets.dart';

class RecommendedCards extends StatelessWidget {
  final Restaurant restaurant;
  const RecommendedCards(
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
        height: 210,
        width: 200,
        margin: EdgeInsets.only(top: 15, right: 12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: restaurant.name,
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(restaurant.pictureUrl()),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 7),
                child: Text(
                  restaurant.name,
                  style: myTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Color(0xFF2E2E2E)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  bottom: 2,
                ),
                child: RatingStars(restaurant.rating),
              ),
            )
          ],
        ),
      ),
    );
  }
}
