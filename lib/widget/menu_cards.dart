part of 'widgets.dart';

class MenuCards extends StatelessWidget {
  final String menus;

  const MenuCards(
    this.menus, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Color(0xFFF1F0F2)),
      ),
      child: Text(
        menus,
        style: myTextStyle.copyWith(
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
