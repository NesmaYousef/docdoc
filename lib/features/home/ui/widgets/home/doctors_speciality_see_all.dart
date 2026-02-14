import 'package:docdoc/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.specializationsScreen);
          },
          child: Text(
            'See All',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
