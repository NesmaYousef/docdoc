
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../logic/cubit/appointments_view_cubit.dart';
import '../../logic/cubit/appointments_view_state.dart';
import '../widgets/appointment_error_widget.dart';
import '../widgets/appointments_tabs.dart';


class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppointmentsViewCubit>()..getAppointments(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Appointment',
          height: 70.h,
        ),
        body: Column(
          children: [
            verticalSpace(12),
            _buildTabBar(),
            Expanded(
              child: BlocBuilder<AppointmentsViewCubit, AppointmentsViewState>(
                buildWhen: (previous, current) =>
                    current is AppointmentsViewLoading ||
                    current is AppointmentsViewSuccess ||
                    current is AppointmentsViewError,
                builder: (context, state) => state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                  error: (error) => AppointmentErrorWidget(
                    message: error.getAllErrorMessages(),
                    onRetry: context.read<AppointmentsViewCubit>().getAppointments,
                  ),
                  success: (list) => AppointmentsTabs(
                    controller: _tabController,
                    appointments: list,
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),

            ),
          ],
        ),
      ),
    );

  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textGray,
            labelStyle: TextStyles.font14PrimarySemiBold,
            unselectedLabelStyle: TextStyles.font14GrayRegular,
            indicatorColor: AppColors.primary,
            indicatorWeight: 2.5,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
          Container(height: 1, color: AppColors.strokeGray.withValues(alpha: 0.3)),
        ],
      ),
    );
  }
}



