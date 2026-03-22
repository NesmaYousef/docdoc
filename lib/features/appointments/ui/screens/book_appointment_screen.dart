import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../home/data/models/specializations_response_model.dart';
import '../../logic/cubit/book_appointment_cubit.dart';
import '../../logic/cubit/book_appointment_state.dart';

import '../widgets/book_appointment/appointment_booking_body.dart';


class BookAppointmentScreen extends StatefulWidget {
  final Doctors doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 1;

  // Stored state
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = '08:30 AM';
  String _appointmentType = 'In Person';
  String _paymentMethod = 'Credit Card';

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Book Appointment',
        onLeadingTap: _previousStep,
      ),
      body: BlocListener<BookAppointmentCubit, BookAppointmentState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (appointment) {
              appointment.doctor = widget.doctor;
              Navigator.pushReplacementNamed(
                context,
                Routes.bookingConfirmedScreen,
                arguments: appointment,
              );
            },
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error.getAllErrorMessages(),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            },
          );
        },

        child: AppointmentBookingBody(
          pageController: _pageController,
          currentStep: _currentStep,
          doctor: widget.doctor,
          selectedDate: _selectedDate,
          selectedTime: _selectedTime,
          appointmentType: _appointmentType,
          paymentMethod: _paymentMethod,
          onDateChanged: (val) => setState(() => _selectedDate = val),
          onTimeChanged: (val) => setState(() => _selectedTime = val),
          onTypeChanged: (val) => setState(() => _appointmentType = val),
          onPaymentChanged: (val) => setState(() => _paymentMethod = val),
          onNextStep: _nextStep,
        ),
      ),
    );
  }
}

