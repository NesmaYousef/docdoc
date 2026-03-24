import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/settings_switch_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _notifFromDrNow = true;
  bool _sound = true;
  bool _vibrate = true;
  bool _appUpdates = false;
  bool _specialOffers = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Notification'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        children: [
          SettingsSwitchTile(
            title: 'Notification From DorNow',
            value: _notifFromDrNow,
            onChanged: (v) => setState(() => _notifFromDrNow = v),
          ),
          SettingsSwitchTile(
            title: 'Sound',
            value: _sound,
            onChanged: (v) => setState(() => _sound = v),
          ),
          SettingsSwitchTile(
            title: 'Vibrate',
            value: _vibrate,
            onChanged: (v) => setState(() => _vibrate = v),
          ),
          SettingsSwitchTile(
            title: 'App Updates',
            value: _appUpdates,
            onChanged: (v) => setState(() => _appUpdates = v),
          ),
          SettingsSwitchTile(
            title: 'Special Offers',
            value: _specialOffers,
            onChanged: (v) => setState(() => _specialOffers = v),
          ),
        ],
      ),
    );
  }
}
