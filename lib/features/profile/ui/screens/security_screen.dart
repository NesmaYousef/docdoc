import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/settings_switch_tile.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool _rememberPassword = true;
  bool _faceId = false;
  bool _pin = true;
  bool _googleAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Security'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        children: [
          SettingsSwitchTile(
            title: 'Remember password',
            value: _rememberPassword,
            onChanged: (v) => setState(() => _rememberPassword = v),
          ),
          SettingsSwitchTile(
            title: 'Face ID',
            value: _faceId,
            onChanged: (v) => setState(() => _faceId = v),
          ),
          SettingsSwitchTile(
            title: 'PIN',
            value: _pin,
            onChanged: (v) => setState(() => _pin = v),
          ),
          SettingsSwitchTile(
            title: 'Google Authenticator',
            value: _googleAuth,
            onChanged: (v) => setState(() => _googleAuth = v),
          ),
        ],
      ),
    );
  }
}
