part of 'details.dart';

class HeaderDetail extends StatefulWidget {
  const HeaderDetail({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderDetailState createState() => _HeaderDetailState();
}

class _HeaderDetailState extends State<HeaderDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return SafeArea(child: Center(child: CircularProgressIndicator()));
      } else if (state.state == ResultState.HasData) {
        return Stack(
          children: [
            Hero(
              tag: state.result.restaurants.pictureUrl(),
              child: Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage(state.result.restaurants.pictureUrl()),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin - 10,
                vertical: defaultMargin - 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigation.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  FavoriteButton(restaurant: state.result.restaurants)
                ],
              ),
            )
          ],
        );
      } else if (state.state == ResultState.NoData) {
        return NoDataPage();
      } else if (state.state == ResultState.Error) {
        return ErrorPage(
          backToHomePage: true,
          onPressed: () {
            setState(() {
              state.fetchDetail(state.id);
            });
          },
        );
      } else {
        return Center(child: Text(''));
      }
    });
  }
}
