import 'package:flutter/material.dart';

class BottomNavItemModel {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const BottomNavItemModel({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
