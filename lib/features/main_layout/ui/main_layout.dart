import 'package:mediqa/features/main_layout/ui/widgets/main_fab.dart';
import 'package:flutter/material.dart';
import 'package:mediqa/features/main_layout/ui/widgets/custom_bottom_nav_bar.dart';
import '../../appointments/ui/screens/appointments_screen.dart';
import '../../home/ui/screens/home_screen.dart';
import '../../profile/ui/screens/profile_screen.dart';


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
    _screens = [
      const HomeScreen(),
      const Placeholder(),
      const AppointmentsScreen(),
      ProfileScreen(onBack: () => setState(() => currentIndex = 0)),
    ];
  }

  void _onNavTap(int index) {
    if (index == currentIndex) return; // avoid unnecessary rebuild
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        }
      },
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(index: currentIndex, children: _screens),
        floatingActionButton: MainFAB(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: _onNavTap,
        ),
      ),
    );
  }
}
