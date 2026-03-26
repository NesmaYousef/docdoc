import 'package:mediqa/core/helpers/spacing.dart';
import 'package:mediqa/core/theme/app_colors.dart';
import 'package:mediqa/core/theme/text_styles.dart';
import 'package:mediqa/core/widgets/app_text_button.dart';
import 'package:mediqa/core/widgets/custom_app_bar.dart';
import 'package:mediqa/core/routing/routes.dart';
import 'package:mediqa/features/home/data/models/specializations_response_model.dart';
import 'package:mediqa/features/home/ui/widgets/doctors_list/doctors_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final Doctors? doctorModel;

  const DoctorDetailsScreen({super.key, this.doctorModel});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.doctorModel?.name ?? 'Doctor Details'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DoctorsListViewItem(
                      doctorsModel: widget.doctorModel,
                    ),
                  ),
                  verticalSpace(24),
                  _buildTabBar(),
                  _buildTabContent(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppTextButton(
              buttonText: 'Make An Appointment',
              textStyle: TextStyles.font16WhiteSemiBold,
              backgroundColor: AppColors.primary,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.bookAppointmentScreen,
                  arguments: widget.doctorModel,
                );
              },
            ),
          ),
        ],
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
            unselectedLabelStyle: TextStyles.font14DarkMedium,
            indicatorColor: AppColors.primary,
            indicatorWeight: 2.5,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Location'),
            ],
          ),
          Container(height: 1, color: AppColors.strokeGray.withValues(alpha: 0.3)),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.only(top: 24.h),
      height: 300.h,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildAboutSection(),
          Text(
            'Location details will be here',
            style: TextStyles.font14GrayRegular,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About me', style: TextStyles.font12DarkRegular),
        verticalSpace(8),
        Text(
          '${widget.doctorModel?.name ?? 'Doctor'} is the top most ${widget.doctorModel?.degree ?? 'specialist'} in Christ Hospital at London, has achieved several awards for her wonderful contribution in medical field, available for private consultation.',
          style: TextStyles.font14GrayRegular,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
