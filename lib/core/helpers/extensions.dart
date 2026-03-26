import 'package:flutter/material.dart';

extension Navigation on BuildContext{
  Future<dynamic> pushNamed(String routeName,{Object? arguments}){
    return Navigator.pushNamed(this, routeName,arguments: arguments);
  }
  Future<dynamic> pushReplacementNamed(String routeName,{Object? arguments}){
    return Navigator.pushReplacementNamed(this, routeName,arguments: arguments);
  }
  Future<dynamic> pushAndRemoveUntil(String routeName,{Object? arguments}){
    return Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,arguments: arguments);
  }
  void pop() => Navigator.pop(this);
}
extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';

  String get initials {
    if (this == null || this!.trim().isEmpty) return 'D';
    final parts = this!.trim().split(' ');
    if (parts.length > 1) {
      return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }
}
extension ListExtension<T> on List<T>?{
  bool isNullOrEmpty()=> this == null || this!.isEmpty;
}
extension MapExtension<K,V> on Map<K,V>?{
  bool isNullOrEmpty()=> this == null || this!.isEmpty;
}