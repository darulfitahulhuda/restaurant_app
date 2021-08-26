part of 'restaurant_list.dart';

class HeaderRestorant extends StatelessWidget {
  const HeaderRestorant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'What would You\nlike to eat?',
          style: Theme.of(context).textTheme.headline5,
        ),
        Image.asset(
          'assets/profile.png',
          width: 50,
        )
      ],
    );
  }
}
