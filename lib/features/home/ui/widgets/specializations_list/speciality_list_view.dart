import 'package:mediqa/features/home/data/models/specializations_response_model.dart';
import 'package:mediqa/features/home/logic/cubit/home_cubit.dart';
import 'package:mediqa/features/home/ui/widgets/specializations_list/speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsList;
  const SpecialityListView({
    super.key,
    required this.specializationsList,
  });

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecialityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child:
      ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: widget.specializationsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecialityIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList( specializationId: widget.specializationsList[index]?.id);
            },
            child: SpecialityItem(
              specializationsData: widget.specializationsList[index],
              itemIndex: index,
              selectedIndex: selectedSpecialityIndex,
            ),
          );
        },
      ),
    );
  }
}
