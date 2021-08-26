part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double rate;
  final double iconSize;
  final double fontSize;
  const RatingStars(this.rate,
      {this.iconSize = 18, this.fontSize = 12, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();

    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < numberOfStars) ? Icons.star : Icons.star_outline,
              size: iconSize,
              color: secondaryColor,
            ),
          ) +
          [
            SizedBox(width: 4),
            Text(
              rate.toString(),
              style: myTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  letterSpacing: 0.4),
            )
          ],
    );
  }
}
