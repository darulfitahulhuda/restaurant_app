part of 'details.dart';

class DescriptionDetail extends StatefulWidget {
  const DescriptionDetail({Key? key}) : super(key: key);

  @override
  _DescriptionDetailState createState() => _DescriptionDetailState();
}

class _DescriptionDetailState extends State<DescriptionDetail> {
  bool isDescription = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.HasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: defaultMargin, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Description',
                    style: myTextStyle.copyWith(
                        fontSize: 14,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.25),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDescription = !isDescription;
                      });
                    },
                    child: Icon(
                      isDescription
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      size: 20,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: isDescription ? 230 : 0,
              child: Text(
                state.result.restaurants.description,
                style: myTextStyle.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        );
      } else if (state.state == ResultState.NoData) {
        return Center();
      } else if (state.state == ResultState.Error) {
        return Center(
          child: Text(''),
        );
      } else {
        return Center(child: Text(''));
      }
    });
  }
}
