import 'package:docdoc/features/home/ui/widgets/doctors_list/doctors_list_view_item.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  final String specialtyName;
  const DoctorsListView({super.key, this.doctorsList, required this.specialtyName});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctorsList?.length,
      itemBuilder: (context, index) {
        return DoctorsListViewItem(
          doctorsModel: doctorsList?[index],
          specialtyName: specialtyName,
        );
      },
    );
  }

}
