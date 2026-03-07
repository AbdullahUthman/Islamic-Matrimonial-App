import 'package:abdullah/models/profile.dart';
import 'package:flutter/material.dart';

class Filter {
  final Map<String, bool> cities;
   final Map<Enum, bool> status;
   final Map<String, bool> children;
  final RangeValues range;

  const Filter({required this.cities, required this.status, required this.children, required this.range});
}