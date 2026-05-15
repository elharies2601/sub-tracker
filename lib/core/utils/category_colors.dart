import 'package:flutter/material.dart';

/// Deterministic color assignment per category.
/// Same category always gets the same color across chart + legend + list.
class CategoryColors {
  CategoryColors._();

  static const _palette = [
    Color(0xFF6366F1), // indigo   — Entertainment
    Color(0xFF10B981), // emerald  — Productivity
    Color(0xFFF59E0B), // amber    — Utilities
    Color(0xFFEF4444), // red      — Health
    Color(0xFF3B82F6), // blue     — Finance
    Color(0xFF8B5CF6), // violet   — Education
    Color(0xFFEC4899), // pink     — Other / overflow
    Color(0xFF14B8A6), // teal
    Color(0xFFF97316), // orange
    Color(0xFF84CC16), // lime
  ];

  /// Returns a consistent color for [category].
  /// Uses a hash so order doesn't matter.
  static Color forCategory(String category) {
    final index = category.hashCode.abs() % _palette.length;
    return _palette[index];
  }

  /// Returns a lighter fill variant for chart segments.
  static Color fillFor(String category) =>
      forCategory(category).withOpacity(0.85);
}
