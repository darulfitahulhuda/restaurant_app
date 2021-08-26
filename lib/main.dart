import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/database/database_helper.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';
import 'package:restaurant_app/provider/provider.dart';
import 'package:restaurant_app/ui/detail/details.dart';

import 'package:restaurant_app/ui/favorite_page/favorite.dart';
import 'package:restaurant_app/ui/pages.dart';
import 'package:restaurant_app/ui/restaurant_list_page/restaurant_list.dart';
import 'package:restaurant_app/ui/search/search.dart';

import 'package:restaurant_app/ui/settings/settings.dart';
import 'package:restaurant_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  await AndroidAlarmManager.initialize();
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => RestaurantsProvider(
                  apiService: ApiService(),
                )),
        ChangeNotifierProvider(
            create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper())),
        ChangeNotifierProvider(
            create: (_) => PreferenceProvider(
                preferenceHelper: PreferenceHelper(
                    sharedPreferences: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
      ],
      child: MaterialApp(
        title: 'Restaurant App',
        theme: myThemeData,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: SpalshPage.routeName,
        routes: {
          SpalshPage.routeName: (context) => SpalshPage(),
          HomePage.routeName: (context) => HomePage(),
          RestaurantListPage.routeNames: (context) => RestaurantListPage(),
          FavoritePage.routeName: (context) => FavoritePage(),
          DetailRestoran.routeName: (context) => DetailRestoran(
              id: ModalRoute.of(context)?.settings.arguments as String),
          SearchPage.routeName: (context) => SearchPage(
              query: ModalRoute.of(context)?.settings.arguments as String),
          SettingPage.routeName: (context) => SettingPage(),
        },
      ),
    );
  }
}
