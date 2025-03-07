import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
          {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
          routeName, (Route<dynamic> route) => false,
          arguments: arguments);

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this == [];
}

extension MapExtension<K, V> on Map<K, V>? {
  bool get isNullOrEmpty => this == null || this == {};
}
