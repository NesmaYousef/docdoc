import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:docdoc/core/helpers/extensions/date_extension.dart';
import 'package:docdoc/core/theme/colors_manager.dart';
import 'package:docdoc/core/theme/text_styles.dart';



class DatePickerSection extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerSection({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<DatePickerSection> createState() => _DatePickerSectionState();
}

class _DatePickerSectionState extends State<DatePickerSection> {
  late List<DateTime> nextDays;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    nextDays = List.generate(
      14,
      (index) => DateTime.now().add(Duration(days: index)),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scroll(bool forward) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        forward
            ? _scrollController.offset + 72.w
            : _scrollController.offset - 72.w,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Select Date', style: TextStyles.font16BlackBold),
            TextButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: widget.selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked != null) widget.onDateSelected(picked);
              },
              child: Text('Set Manual', style: TextStyles.font13BlueRegular),
            )
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            InkWell(
              onTap: () => _scroll(false),
              child: Icon(Icons.chevron_left, color: ColorsManager.gray, size: 24.w),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: SizedBox(
                height: 80.h,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: nextDays.length,
                  itemBuilder: (context, index) {
                    final date = nextDays[index];
                    final isSelected = _isSameDay(date, widget.selectedDate);

                    return GestureDetector(
                      onTap: () => widget.onDateSelected(date),
                      child: Container(
                        width: 60.w,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorsManager.mainBlue
                              : ColorsManager.unselectedDateCardBg,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date.toShortDayName,

                              style: isSelected
                                  ? TextStyles.font12WhiteSemiBold.copyWith(fontSize: 11.sp)
                                  : TextStyles.font12GrayRegular.copyWith(
                                      color: ColorsManager.unselectedDateText,
                                      fontSize: 11.sp,
                                    ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              date.toDayNumber,

                              style: isSelected
                                  ? TextStyles.font16WhiteMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    )
                                  : TextStyles.font14DarkBlueMedium.copyWith(
                                      color: ColorsManager.unselectedDateText,
                                      fontSize: 14.sp,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 8.w),
            InkWell(
              onTap: () => _scroll(true),
              child: Icon(Icons.chevron_right, color: ColorsManager.gray, size: 24.w),
            ),
          ],
        ),

      ],
    );
  }


  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
