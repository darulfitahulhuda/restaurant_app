part of 'details.dart';

class DrinkDetail extends StatelessWidget {
  const DrinkDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.HasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: defaultMargin, bottom: 10),
              child: Text(
                'Drinks',
                style: myTextStyle.copyWith(
                    fontSize: 14,
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.25),
              ),
            ),
            Container(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.result.restaurants.menus!.foods.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      width: 130,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFf7f7f7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/default_menu.png',
                            height: 90,
                            fit: BoxFit.fill,
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              color: primaryColor,
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                state.result.restaurants.menus!.drinks[index]
                                    .name,
                                style: myTextStyle.copyWith(
                                  fontSize: 13,
                                  color: backgroundColor1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
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
