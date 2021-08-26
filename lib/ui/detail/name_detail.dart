part of 'details.dart';

class NameDetail extends StatelessWidget {
  const NameDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.HasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.result.restaurants.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 -
                                (defaultMargin * 2),
                            child: Text(
                              state.result.restaurants.city,
                              overflow: TextOverflow.fade,
                              style: myTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.25,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 -
                                (defaultMargin * 2),
                            child: Text(
                              state.result.restaurants.address!,
                              overflow: TextOverflow.fade,
                              style: myTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.25,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 4),
                RatingStars(
                  state.result.restaurants.rating,
                  iconSize: 18,
                  fontSize: 12,
                ),
              ],
            ),
          ],
        );
      } else if (state.state == ResultState.NoData) {
        return SizedBox();
      } else if (state.state == ResultState.Error) {
        return SizedBox();
      } else {
        return Center(child: Text(''));
      }
    });
  }
}
