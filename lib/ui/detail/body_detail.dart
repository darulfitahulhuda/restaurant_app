part of 'details.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameDetail(),
          DescriptionDetail(),
          FoodDetail(),
          DrinkDetail(),
          CustomerReviews(),
        ],
      ),
    );
  }
}
