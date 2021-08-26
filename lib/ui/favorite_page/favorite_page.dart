part of 'favorite.dart';

class FavoritePage extends StatefulWidget {
  static const routeName = '/favorite_page';
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    getInit();
  }

  getInit() async {
    Provider.of<DatabaseProvider>(context, listen: false).getFavorites();
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Favorite')),
      ),
      body: FavoriteList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Favorite'),
      ),
      child: FavoriteList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
