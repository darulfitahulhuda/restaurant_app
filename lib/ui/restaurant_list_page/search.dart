part of 'restaurant_list.dart';

class SearchRestorant extends StatefulWidget {
  const SearchRestorant({Key? key}) : super(key: key);

  @override
  _SearchRestorantState createState() => _SearchRestorantState();
}

class _SearchRestorantState extends State<SearchRestorant> {
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
        return Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          width: double.infinity,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF504F5E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12),
          ),
          child: TextFormField(
            controller: _textController,
            style: myTextStyle.copyWith(color: primaryColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Tap here to search...',
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, SearchPage.routeName,
                          arguments: _textController.text);
                    });
                  },
                  icon: Icon(Icons.search)),
            ),
          ),
        );
      },
    );
  }
}
