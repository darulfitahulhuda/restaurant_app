part of 'provider.dart';

class RestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantsProvider({required this.apiService}) {
    fetchAllRestaurant();
    recommendedRestaurant();
    searchRestaurants(query);
  }

  late ListRestaurantResult _restaurantsResult;
  late List<Restaurant> _restaurant;
  String _message = '';
  String _query = '';
  ResultState _state = ResultState.Loading;

  ListRestaurantResult get result => _restaurantsResult;
  List<Restaurant> get recommended => _restaurant;
  String get message => _message;
  String get query => _query;
  ResultState get state => _state;

  Future<dynamic> fetchAllRestaurant() async {
    try {
      final result = await apiService.list();

      if (result.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantsResult = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future<dynamic> recommendedRestaurant() async {
    try {
      var api = await apiService.list();

      final result =
          api.restaurants.where((element) => element.rating > 4.5).toList();

      if (result.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurant = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future<dynamic> searchRestaurants(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final result = await apiService.search(query);

      if (result.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Not found';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantsResult = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }
}
