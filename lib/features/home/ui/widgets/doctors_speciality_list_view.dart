import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:docdoc/features/home/ui/widgets/doctors_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            specializationsData: specializationsList,
            itemIndex: index,
          );
        },
      ),
    );
  }
}
