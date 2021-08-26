part of 'settings.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceProvider>(builder: (context, provider, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin),
        child: ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Scheduling Restaurant'),
          trailing: Consumer<SchedulingProvider>(
            builder: (context, scheduled, _) {
              return Switch.adaptive(
                  value: provider.isDailyReminder,
                  onChanged: (value) async {
                    provider.enableDailyReminder(value);
                    scheduled.scheduledRestaurants(value);
                  });
            },
          ),
        ),
      );
    });
  }
}
