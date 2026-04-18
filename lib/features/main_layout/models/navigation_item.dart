import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class NavigationItem extends Equatable {
  final String label;
  final IconData icon;
  final String route;

  const NavigationItem({
    required this.label,
    required this.icon,
    required this.route,
  });

  @override
  List<Object?> get props => [label, icon, route];
}