part of 'search.dart';

class SearchField extends StatefulWidget {
  final String query;
  const SearchField({Key? key, required this.query}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _controller = TextEditingController();
  String query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: primaryColor,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 6),
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
                  style: myTextStyle.copyWith(color: primaryColor),
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (query != '') {
                              state.searchRestaurants(query);
                              setState(() {
                                _controller.clear();
                              });
                            } else {
                              state.fetchAllRestaurant();
                              _controller.clear();
                              setState(() {
                                query = '';
                              });
                            }
                          });
                        },
                        child: Icon(Icons.search)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      state.searchRestaurants(value);

                      if (value != '') {
                        if (value == widget.query) {
                          state.searchRestaurants(widget.query);
                        } else {
                          query = value;
                          state.searchRestaurants(query);
                        }
                      } else {
                        state.fetchAllRestaurant();
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
