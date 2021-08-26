part of 'provider.dart';

class PreferenceProvider extends ChangeNotifier {
  final PreferenceHelper preferenceHelper;

  PreferenceProvider({required this.preferenceHelper}) {
    _getDailyReminder();
  }

  bool _isDailyReminder = false;
  bool get isDailyReminder => _isDailyReminder;

  void _getDailyReminder() async {
    _isDailyReminder = await preferenceHelper.isDailyReminderActive;
    notifyListeners();
  }

  void enableDailyReminder(bool value) async {
    preferenceHelper.setDailyReminder(value);
    _getDailyReminder();
    notifyListeners();
  }
}
