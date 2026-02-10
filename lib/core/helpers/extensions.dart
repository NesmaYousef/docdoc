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
extension StringExtension on String?{
  bool isNullOrEmpty()=> this == null || this == '';
}
extension ListExtension<T> on List<T>?{
  bool isNullOrEmpty()=> this == null || this!.isEmpty;
}