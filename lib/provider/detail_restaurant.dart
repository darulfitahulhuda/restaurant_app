part of 'provider.dart';

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailProvider({required this.apiService, required this.id}) {
    fetchDetail(this.id);
  }

  late DetailRestaurantResult _restaurantResult;
  String _message = '';
  late ResultState _state;
  late CustomerReviewResult _review;

  String get message => _message;
  DetailRestaurantResult get result => _restaurantResult;
  ResultState get state => _state;
  CustomerReviewResult get review => _review;

  Future<dynamic> fetchDetail(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final result = await apiService.detail(id);

      if (result.restaurants.id.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Data not found';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future<dynamic> createReview(String review) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final result = await apiService.createReview(this.id, review);
      if (result.error == true) {
        _state = ResultState.Error;
        notifyListeners();
        return _message = result.message;
      } else {
        _state = ResultState.HasData;
        _restaurantResult.restaurants.customerReviews = result.customerReviews;
        notifyListeners();
        return _review = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }
}
