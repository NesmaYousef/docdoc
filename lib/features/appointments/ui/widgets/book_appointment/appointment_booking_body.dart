import 'package:docdoc/core/helpers/extensions/date_extension.dart';
import 'package:docdoc/features/appointments/ui/widgets/book_appointment/step_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../home/data/models/specializations_response_model.dart';
import '../../../logic/cubit/book_appointment_cubit.dart';
import '../../../logic/cubit/book_appointment_state.dart';


import 'book_step1_date_time_type.dart';
import 'book_step2_payment.dart';
import 'book_step3_summary.dart';

class AppointmentBookingBody extends StatelessWidget {
  final PageController pageController;
  final int currentStep;
  final Doctors doctor;
  final DateTime selectedDate;
  final String selectedTime;
  final String appointmentType;
  final String paymentMethod;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<String> onTimeChanged;
  final ValueChanged<String> onTypeChanged;
  final ValueChanged<String> onPaymentChanged;
  final VoidCallback onNextStep;


  const AppointmentBookingBody({
    super.key,
    required this.pageController,
    required this.currentStep,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
    required this.appointmentType,
    required this.paymentMethod,
    required this.onDateChanged,
    required this.onTimeChanged,
    required this.onTypeChanged,
    required this.onPaymentChanged,
    required this.onNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        StepIndicator(currentStep: currentStep),
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BookStep1DateTimeType(
                selectedDate: selectedDate,
                selectedTime: selectedTime,
                appointmentType: appointmentType,
                onDateChanged: onDateChanged,
                onTimeChanged: onTimeChanged,
                onTypeChanged: onTypeChanged,
                onContinue: onNextStep,
              ),
              BookStep2Payment(
                selectedPayment: paymentMethod,
                onPaymentChanged: onPaymentChanged,
                onContinue: onNextStep,
              ),
              BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                buildWhen: (previous, current) =>
                    current is BookAppointmentLoading ||
                    current is BookAppointmentSuccess ||
                    current is BookAppointmentError,
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => _buildSummary(context, true),
                    orElse: () => _buildSummary(context, false),
                  );
                },
              ),



            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummary(BuildContext context, bool isLoading) {
    return BookStep3Summary(
      doctor: doctor,
      selectedDate: selectedDate.toFullDateString,
      selectedTime: selectedTime,
      appointmentType: appointmentType,
      paymentMethod: paymentMethod,
      onBookNow: () {
        context.read<BookAppointmentCubit>().bookAppointment(
              doctorId: doctor.id ?? 1,
              selectedDate: selectedDate,
              selectedTime: selectedTime,
              appointmentType: appointmentType,
            );
      },
      isLoading: isLoading,
    );
  }
}

