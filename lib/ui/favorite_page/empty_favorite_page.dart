part of 'favorite.dart';

class EmptyFavoritePage extends StatelessWidget {
  const EmptyFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 100,
            color: secondaryColor,
          ),
          SizedBox(height: 20),
          Text(
            "You don't have favorite Restaurant?",
            style: myTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor),
          ),
          SizedBox(height: 12),
          Text(
            "Let's find your favorite restaurant",
            style: myTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(12))),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomePage.routeName, (route) => false);
              },
              child: Text(
                "Find Restaurant",
                style: myTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
