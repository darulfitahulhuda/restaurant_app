part of 'settings.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/settings_page';
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildAndroid(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Settings')),
        ),
        body: SettingMenu(),
      );
    }

    Widget _buildIos(BuildContext context) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Settings'),
        ),
        child: SettingMenu(),
      );
    }

    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
