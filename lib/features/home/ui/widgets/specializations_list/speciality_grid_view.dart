import 'package:mediqa/features/home/data/models/specializations_response_model.dart';
import 'package:mediqa/features/home/ui/widgets/specializations_list/speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityGridView extends StatelessWidget {
  final List<SpecializationsData?> specializationsList;

  const SpecialityGridView({super.key, required this.specializationsList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),

        padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 18.w,
          mainAxisSpacing: 28.h,
          childAspectRatio: 0.78,
        ),
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return SpecialityItem(
            specializationsData: specializationsList[index],
            itemIndex: index,
            isGridView: true,
          );
        },

    );
  }
}
