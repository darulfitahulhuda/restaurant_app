part of 'widgets.dart';

class CustomerReviewCard extends StatelessWidget {
  final CustomerReview customer;
  const CustomerReviewCard({Key? key, required this.customer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text(customer.name[0]),
              ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name,
                    style: myTextStyle.copyWith(
                        fontSize: 14,
                        color: primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    customer.date,
                    style:
                        myTextStyle.copyWith(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 6),
          Text(
            customer.review,
            style: myTextStyle.copyWith(
                fontSize: 12, color: primaryColor, fontWeight: FontWeight.w500),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
