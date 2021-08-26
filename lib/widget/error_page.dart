part of 'widgets.dart';

class ErrorPage extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final bool backToHomePage;
  const ErrorPage(
      {Key? key,
      required this.onPressed,
      this.text = 'Refresh',
      this.backToHomePage = false})
      : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Lottie.asset(
                'assets/lottie/58200-no-internet.json',
                width: MediaQuery.of(context).size.width - (defaultMargin * 2),
              )),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            width: 200,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(12))),
              onPressed: widget.onPressed,
              child: Text(
                widget.text,
                style: myTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          widget.backToHomePage
              ? Container(
                  margin: EdgeInsets.only(top: defaultMargin / 2),
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(12))),
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    child: Text(
                      'Back to Home',
                      style: myTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
