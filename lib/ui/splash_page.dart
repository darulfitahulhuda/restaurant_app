part of 'pages.dart';

class SpalshPage extends StatefulWidget {
  static const routeName = '/splash_page';

  const SpalshPage({Key? key}) : super(key: key);

  @override
  _SpalshPageState createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _backgroundService = BackgroundService();

  @override
  void initState() {
    super.initState();

    port.listen((message) async {
      await _backgroundService.someTask();
    });

    _notificationHelper
        .configureSelectNotificationSubject(DetailRestoran.routeName);

    getInit();
    timer();
  }

  getInit() async {
    await Provider.of<RestaurantsProvider>(context, listen: false)
        .recommendedRestaurant();
  }

  void timer() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
        context,
        HomePage.routeName,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    selectNotificationSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
              color: secondaryColor,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
