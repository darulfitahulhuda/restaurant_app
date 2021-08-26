part of 'provider.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    getFavorites();
  }

  ResultState _state = ResultState.Loading;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Restaurant> _restaurant = [];
  List<Restaurant> get restaurant => _restaurant;

  void getFavorites() async {
    _restaurant = await databaseHelper.getFavorites();

    if (_restaurant.length > 0) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Empty Data';
    }

    notifyListeners();
  }

  void addFavorites(Restaurant restaurant) async {
    try {
      await databaseHelper.insertFavorite(restaurant);
      getFavorites();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error : $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    final favortieRestaurant = await databaseHelper.getFavoriteById(id);
    return favortieRestaurant.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.deleteFavorites(id);
      getFavorites();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
