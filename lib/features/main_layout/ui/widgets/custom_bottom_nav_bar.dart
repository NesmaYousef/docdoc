import 'package:flutter/material.dart';
import '../../data/models/bottom_nav_item_model.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const double _fabSpace = 40;

  static const List<BottomNavItemModel> _items = [
    BottomNavItemModel(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    BottomNavItemModel(
      icon: Icons.chat_bubble_outline,
      activeIcon: Icons.chat_bubble,
      label: 'Messages',
    ),
    BottomNavItemModel(
      icon: Icons.calendar_today_outlined,
      activeIcon: Icons.calendar_today,
      label: 'Schedule',
    ),
    BottomNavItemModel(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      notchMargin: 8,
      elevation: 10,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._buildItems(0, 2),
            const SizedBox(width: _fabSpace),
            ..._buildItems(2, 4),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItems(int start, int end) {
    return List.generate(
      end - start,
          (i) {
        final index = start + i;
        final item = _items[index];
        final isActive = currentIndex == index;
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onTap(index),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedScale(
                  scale: isActive ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    isActive ? item.activeIcon : item.icon,
                    color:
                    isActive ? Colors.blue : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedDefaultTextStyle(
                  duration:
                  const Duration(milliseconds: 250),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isActive
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color:
                    isActive ? Colors.blue : Colors.grey,
                  ),
                  child: Text(item.label),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
