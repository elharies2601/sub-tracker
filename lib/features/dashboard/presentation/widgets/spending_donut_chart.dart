import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/utils/category_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../domain/models/category_spending.dart';

/// Animated donut chart drawn with CustomPainter.
/// No external chart library — keeps the dependency footprint small.
class SpendingDonutChart extends StatefulWidget {
  final List<CategorySpending> categories;
  final double totalMonthly;
  final String currency;

  const SpendingDonutChart({
    super.key,
    required this.categories,
    required this.totalMonthly,
    required this.currency,
  });

  @override
  State<SpendingDonutChart> createState() => _SpendingDonutChartState();
}

class _SpendingDonutChartState extends State<SpendingDonutChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _sweep;
  int? _tappedIndex;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _sweep = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _ctrl.forward();
  }

  @override
  void didUpdateWidget(SpendingDonutChart old) {
    super.didUpdateWidget(old);
    if (old.categories != widget.categories) {
      _ctrl.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // ── Donut + center label ───────────────────────────────────
        SizedBox(
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _sweep,
                builder: (_, __) => CustomPaint(
                  size: const Size(200, 200),
                  painter: _DonutPainter(
                    categories: widget.categories,
                    progress: _sweep.value,
                    tappedIndex: _tappedIndex,
                    onTap: (i) => setState(
                      () => _tappedIndex = _tappedIndex == i ? null : i,
                    ),
                  ),
                ),
              ),
              // Center total label
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'monthly',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    CurrencyFormatter.format(
                      _tappedIndex != null
                          ? widget.categories[_tappedIndex!].monthlyAmount
                          : widget.totalMonthly,
                      widget.currency,
                    ),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (_tappedIndex != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      widget.categories[_tappedIndex!].category,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: CategoryColors.forCategory(
                          widget.categories[_tappedIndex!].category,
                        ),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ── Legend ────────────────────────────────────────────────
        ...widget.categories.asMap().entries.map((entry) {
          final i = entry.key;
          final cat = entry.value;
          final isSelected = _tappedIndex == i;
          final color = CategoryColors.forCategory(cat.category);

          return GestureDetector(
            onTap: () => setState(() => _tappedIndex = isSelected ? null : i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? color.withValues(alpha: 0.08)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? color.withValues(alpha: 0.4)
                      : Colors.transparent,
                ),
              ),
              child: Row(
                children: [
                  // Color swatch
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Category name + count
                  Expanded(
                    child: Text(
                      '${cat.category} (${cat.count})',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  // Percentage
                  Text(
                    '${cat.percentage.toStringAsFixed(1)}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Amount
                  Text(
                    CurrencyFormatter.format(
                      cat.monthlyAmount,
                      widget.currency,
                    ),
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

// ── Custom painter ─────────────────────────────────────────────────

class _DonutPainter extends CustomPainter {
  final List<CategorySpending> categories;
  final double progress;
  final int? tappedIndex;
  final void Function(int) onTap;

  _DonutPainter({
    required this.categories,
    required this.progress,
    required this.tappedIndex,
    required this.onTap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2 - 4;
    const strokeWidth = 28.0;
    const gapAngle = 0.025; // small gap between segments

    double startAngle = -math.pi / 2; // start from top

    for (int i = 0; i < categories.length; i++) {
      final cat = categories[i];
      final sweep = (cat.percentage / 100) * 2 * math.pi * progress - gapAngle;
      if (sweep <= 0) {
        startAngle += (cat.percentage / 100) * 2 * math.pi * progress;
        continue;
      }

      final isSelected = tappedIndex == i;
      final color = CategoryColors.forCategory(cat.category);
      final radius = isSelected ? outerRadius + 4 : outerRadius;

      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? strokeWidth + 4 : strokeWidth
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + gapAngle / 2,
        sweep,
        false,
        paint,
      );

      startAngle += (cat.percentage / 100) * 2 * math.pi * progress;
    }
  }

  @override
  bool? hitTest(Offset position) => true; // handle taps in GestureDetector

  @override
  bool shouldRepaint(_DonutPainter old) =>
      old.progress != progress || old.tappedIndex != tappedIndex;
}
