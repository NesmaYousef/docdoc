import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class SearchSortByBottomSheet extends StatefulWidget {
  final List<String> sortOptions;
  final String selectedSort;
  final ValueChanged<String> onSortChanged;

  const SearchSortByBottomSheet({
    super.key,
    required this.sortOptions,
    required this.selectedSort,
    required this.onSortChanged,
  });

  @override
  State<SearchSortByBottomSheet> createState() => _SearchSortByBottomSheetState();
}

class _SearchSortByBottomSheetState extends State<SearchSortByBottomSheet> {
  late String _selectedSort;

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.selectedSort;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.strokeGray,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            verticalSpace(24),
            Center(
              child: Text(
                'Sort By',
                style: TextStyles.font18DarkBold,
              ),
            ),
            verticalSpace(16),
            const Divider(height: 1, color: AppColors.strokeGray),
            verticalSpace(24),
            Text(
              'Sort Order',
              style: TextStyles.font16BlackBold,
            ),
            verticalSpace(16),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: widget.sortOptions.map((option) {
                final isSelected = _selectedSort == option;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedSort = option;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.primarySurface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      option,
                      style: TextStyles.font14GrayRegular.copyWith(
                        color: isSelected ? Colors.white : AppColors.textDark,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            verticalSpace(32),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  widget.onSortChanged(_selectedSort);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Done',
                  style: TextStyles.font16BlackBold.copyWith(color: Colors.white),
                ),
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
