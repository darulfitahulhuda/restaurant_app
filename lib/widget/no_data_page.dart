part of 'widgets.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Lottie.asset('assets/lottie/28344-page-not-found-animation.json'),
        Text(
          'Not Found',
          style: myTextStyle.copyWith(color: primaryColor, fontSize: 32),
        )
      ],
    ));
  }
}
