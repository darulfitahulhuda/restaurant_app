part of 'details.dart';

class CustomerReviews extends StatelessWidget {
  const CustomerReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    TextEditingController textEditingController = TextEditingController();

    return Consumer<DetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.HasData) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Review...',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      state.createReview(textEditingController.text);
                    },
                    child: Icon(
                      Icons.send,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                itemCount: state.result.restaurants.customerReviews!.length,
                itemBuilder: (context, index) {
                  return CustomerReviewCard(
                      customer:
                          state.result.restaurants.customerReviews![index]);
                }),
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
