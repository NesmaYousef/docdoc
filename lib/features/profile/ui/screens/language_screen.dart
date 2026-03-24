import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/profile_save_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selected = 'English';

  static const _languages = [
    'Arab',
    'English',
    'France',
    'Ethiopia',
    'Indonesia',
    'India',
    'Italia',
    'Japan',
    'Russia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Language'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyles.font14GrayRegular,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xffF5F5F5),
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: _languages.length,
              itemBuilder: (context, i) {
                final lang = _languages[i];
                return RadioListTile<String>(
                  title: Text(lang,
                      style: TextStyles.font14DarkBlueMedium
                          .copyWith(color: Colors.black87)),
                  value: lang,
                  groupValue: _selected,
                  activeColor: ColorsManager.mainBlue,
                  onChanged: (v) => setState(() => _selected = v!),
                );
              },
            ),
          ),
          ProfileSaveButton(onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
