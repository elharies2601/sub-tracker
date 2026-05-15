import 'package:flutter/material.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../domain/models/monthly_spending.dart';
import 'tooltip_bubble.dart';

/// Animated bar chart showing monthly spending over the last 6 months.
/// Custom painted — no external chart library.
class MonthlyBarChart extends StatefulWidget {
  final List<MonthlySpending> months;
  final String currency;

  const MonthlyBarChart({
    super.key,
    required this.months,
    required this.currency,
  });

  @override
  State<MonthlyBarChart> createState() => _MonthlyBarChartState();
}

class _MonthlyBarChartState extends State<MonthlyBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _grow;
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _grow = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final maxAmount = widget.months.fold(
      0.0,
      (m, s) => s.amount > m ? s.amount : m,
    );
    final now = DateTime.now();

    // Tooltip floats above via Stack + Positioned — never pushes bars down.
    // Total container = tooltipHeight + gap + barAreaHeight.
    const barAreaHeight = 100.0;
    const tooltipHeight = 28.0;
    const tooltipGap = 4.0;
    const totalHeight = barAreaHeight + tooltipHeight + tooltipGap;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: totalHeight,
          child: AnimatedBuilder(
            animation: _grow,
            builder: (_, __) => Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: widget.months.asMap().entries.map((entry) {
                final i = entry.key;
                final month = entry.value;
                final isCurrentMonth =
                    month.year == now.year && month.month == now.month;
                final isHovered = _hoveredIndex == i;
                final barHeight = maxAmount > 0
                    ? (month.amount / maxAmount) * _grow.value * barAreaHeight
                    : 0.0;
                final hasData = month.amount > 0;
                // Empty months get a fixed 4px stub so the chart isn't blank,
                // but it's clearly distinguishable from real data bars.
                final clampedBar = hasData
                    ? barHeight.clamp(4.0, barAreaHeight)
                    : 4.0;

                return Expanded(
                  child: GestureDetector(
                    onTapDown: (_) => setState(() => _hoveredIndex = i),
                    onTapUp: (_) => setState(() => _hoveredIndex = null),
                    onTapCancel: () => setState(() => _hoveredIndex = null),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      // Stack: bar sits at bottom, tooltip floats above it
                      // clipBehavior: Clip.none lets tooltip overflow upward
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          // ── Bar ──────────────────────────────────────
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: clampedBar,
                            decoration: BoxDecoration(
                              color: !hasData
                                  // No data: very faint stub
                                  ? primary.withValues(alpha: 0.1)
                                  : isCurrentMonth
                                  ? primary
                                  : isHovered
                                  ? primary.withValues(alpha: 0.7)
                                  : primary.withValues(alpha: 0.3),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(6),
                              ),
                            ),
                          ),

                          // ── Tooltip — floats above bar top ───────────
                          if (isHovered && hasData)
                            Positioned(
                              bottom: clampedBar + tooltipGap,
                              child: TooltipBubble(
                                label: CurrencyFormatter.format(
                                  month.amount,
                                  widget.currency,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // ── Month labels ───────────────────────────────────────────────
        Row(
          children: widget.months.map((m) {
            final isCurrentMonth = m.year == now.year && m.month == now.month;
            return Expanded(
              child: Text(
                m.label,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isCurrentMonth
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withValues(alpha: 0.45),
                  fontWeight: isCurrentMonth
                      ? FontWeight.w700
                      : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
