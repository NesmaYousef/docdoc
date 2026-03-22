import 'package:docdoc/features/main_layout/ui/widgets/main_fab.dart';
import 'package:flutter/material.dart';
import 'package:docdoc/features/main_layout/ui/widgets/custom_bottom_nav_bar.dart';
import '../../appointments/ui/screens/appointments_screen.dart';
import '../../home/ui/screens/home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomeScreen(),
      Placeholder(),
      AppointmentsScreen(),
      Placeholder(),
    ];
  }

  void _onNavTap(int index) {
    if (index == currentIndex) return; // avoid unnecessary rebuild
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: _screens),
      floatingActionButton: MainFAB(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
