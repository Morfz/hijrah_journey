import 'package:flutter/material.dart';

class NotificationSettingsPages extends StatefulWidget {
  const NotificationSettingsPages({super.key});

  @override
  State<NotificationSettingsPages> createState() =>
      _NotificationSettingsPagesState();
}

class _NotificationSettingsPagesState extends State<NotificationSettingsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Settings'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Restaurant Notification",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      true ? "Enable Notification" : "Disable Notification",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                const Switch(value: true, onChanged: null

                    // (value) async {
                    //   if (Platform.isIOS) {
                    //     customDialog(context);
                    //   } else {
                    //     _changeSetting(value);
                    //     scheduled.scheduledNews(value);
                    //   }
                    // },
                    )
              ],
            )));
  }
}
