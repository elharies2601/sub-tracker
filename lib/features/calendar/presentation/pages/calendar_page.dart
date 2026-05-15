import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_tracker_v2/features/subscription/presentation/widgets/payment_history_list.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/category_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/calendar_event.dart';
import '../providers/calendar_provider.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    // Select today by default
    final now = DateTime.now();
    _selectedDay = DateTime(now.year, now.month, now.day);
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(calendarEventsProvider);
    final monthlyTotal = ref.watch(calendarMonthlyTotalProvider);
    final selectedEvents = _selectedDay != null
        ? ref.watch(eventsForDayProvider(_selectedDay!))
        : <CalendarEvent>[];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── App bar ──────────────────────────────────────────
          SliverAppBar(
            title: const Text('Calendar'),
            centerTitle: false,
            pinned: true,
            // Monthly total in app bar subtitle
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(36),
              child: _MonthlyTotalBar(total: monthlyTotal),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                // ── Calendar ───────────────────────────────────
                _CalendarWidget(
                  focusedDay: _focusedDay,
                  selectedDay: _selectedDay,
                  events: events,
                  onDaySelected: (selected, focused) {
                    setState(() {
                      _selectedDay = DateTime(
                        selected.year,
                        selected.month,
                        selected.day,
                      );
                      _focusedDay = focused;
                    });
                  },
                  onPageChanged: (focused) {
                    _focusedDay = focused;
                    ref
                        .read(calendarFocusedMonthProvider.notifier)
                        .setMonth(focused);
                  },
                ),

                const Divider(height: 1),

                // ── Day detail panel ───────────────────────────
                _DayDetailPanel(
                  selectedDay: _selectedDay,
                  events: selectedEvents,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  MONTHLY TOTAL BAR
// ══════════════════════════════════════════════════════════════════

class _MonthlyTotalBar extends StatelessWidget {
  final (double, String) total;
  const _MonthlyTotalBar({required this.total});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Text(
        l10n.totalThisMonth(CurrencyFormatter.format(total.$1, total.$2)),
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  CALENDAR WIDGET
// ══════════════════════════════════════════════════════════════════

class _CalendarWidget extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Map<DateTime, List<CalendarEvent>> events;
  final void Function(DateTime, DateTime) onDaySelected;
  final void Function(DateTime) onPageChanged;

  const _CalendarWidget({
    required this.focusedDay,
    required this.selectedDay,
    required this.events,
    required this.onDaySelected,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TableCalendar<CalendarEvent>(
      firstDay: DateTime(2020),
      lastDay: DateTime(2030),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      eventLoader: (day) {
        final key = DateTime(day.year, day.month, day.day);
        return events[key] ?? [];
      },
      onDaySelected: onDaySelected,
      onPageChanged: onPageChanged,
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      startingDayOfWeek: StartingDayOfWeek.monday,

      // ── Styles ───────────────────────────────────────────────
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: theme.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w700,
        ),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: theme.colorScheme.onSurface,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: theme.colorScheme.onSurface,
        ),
        headerPadding: const EdgeInsets.symmetric(vertical: 8),
      ),

      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: theme.textTheme.labelSmall!.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          fontWeight: FontWeight.w600,
        ),
        weekendStyle: theme.textTheme.labelSmall!.copyWith(
          color: theme.colorScheme.error.withValues(alpha: 0.7),
          fontWeight: FontWeight.w600,
        ),
      ),

      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,

        // Today
        todayDecoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),

        // Selected
        selectedDecoration: BoxDecoration(
          color: theme.colorScheme.primary,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.w700,
        ),

        // Default days
        defaultTextStyle: theme.textTheme.bodySmall!,
        weekendTextStyle: theme.textTheme.bodySmall!.copyWith(
          color: theme.colorScheme.error.withValues(alpha: 0.7),
        ),
        outsideTextStyle: theme.textTheme.bodySmall!.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
        ),

        markerSize: 6,
        markersMaxCount: 3,
        markerDecoration: BoxDecoration(
          color: theme.colorScheme.primary,
          shape: BoxShape.circle,
        ),
        markersAlignment: Alignment.bottomCenter,
        markerMargin: const EdgeInsets.symmetric(horizontal: 1),
        cellMargin: const EdgeInsets.all(4),
      ),

      // ── Custom marker builder — color-coded per category ─────
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, dayEvents) {
          if (dayEvents.isEmpty) return const SizedBox.shrink();

          // Show up to 3 colored dots, one per subscription
          final dots = dayEvents.take(3).map((e) {
            final color = CategoryColors.forCategory(e.subscription.category);
            return Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            );
          }).toList();

          // Add +N badge if more than 3
          if (dayEvents.length > 3) {
            return Positioned(
              bottom: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...dots,
                  Text(
                    '+${dayEvents.length - 3}',
                    style: TextStyle(
                      fontSize: 7,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            );
          }

          return Positioned(
            bottom: 2,
            child: Row(mainAxisSize: MainAxisSize.min, children: dots),
          );
        },
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  DAY DETAIL PANEL
// ══════════════════════════════════════════════════════════════════

class _DayDetailPanel extends StatelessWidget {
  final DateTime? selectedDay;
  final List<CalendarEvent> events;

  const _DayDetailPanel({required this.selectedDay, required this.events});

  String _formatDate(DateTime d) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    if (selectedDay == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Panel header ──────────────────────────────────────
          Row(
            children: [
              Text(
                _formatDate(selectedDay!),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              if (events.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${events.length} bill${events.length > 1 ? 's' : ''}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Event list or empty state ─────────────────────────
          if (events.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.event_available_outlined,
                      size: 40,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.noBillsOnThisDay,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...events.map((e) => _EventTile(event: e)),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  EVENT TILE
// ══════════════════════════════════════════════════════════════════

class _EventTile extends StatelessWidget {
  final CalendarEvent event;
  const _EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sub = event.subscription;
    final color = CategoryColors.forCategory(sub.category);
    final l10n = AppLocalizations.of(context)!;

    final (statusLabel, statusColor) = switch (true) {
      _ when event.isPaid => (l10n.statusPaid, const Color(0xFF10B981)),
      _ when event.isOverdue => (
        l10n.cardBadgeOverdue,
        theme.colorScheme.error,
      ),
      _ when event.isToday => (
        l10n.cardBadgeDueToday,
        theme.colorScheme.tertiary,
      ),
      _ => (
        sub.billingCycle.name[0].toUpperCase() +
            sub.billingCycle.name.substring(1),
        theme.colorScheme.onSurface.withValues(alpha: 0.45),
      ),
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: event.isPaid
            ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2)
            : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: event.isPaid
              ? const Color(0xFF10B981).withValues(alpha: 0.25)
              : event.isOverdue
              ? theme.colorScheme.error.withValues(alpha: 0.3)
              : theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        onTap: () => context.push('/subscriptions/${sub.id}'),
        // Avatar — dimmed when paid
        leading: Opacity(
          opacity: event.isPaid ? 0.5 : 1.0,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: color.withValues(alpha: 0.15),
            child: Text(
              sub.name.isNotEmpty ? sub.name[0].toUpperCase() : '?',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
        title: Text(
          sub.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            // Strike-through when paid
            decoration: event.isPaid ? TextDecoration.lineThrough : null,
            color: event.isPaid
                ? theme.colorScheme.onSurface.withValues(alpha: 0.45)
                : null,
          ),
        ),
        subtitle: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            Flexible(
              child: Text(
                sub.category,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (event.isPaid) ...[
                      Icon(
                        Icons.check_circle_rounded,
                        size: 10,
                        color: statusColor,
                      ),
                      const SizedBox(width: 3),
                    ],
                    Flexible(
                      child: Text(
                        statusLabel,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              CurrencyFormatter.format(sub.amount, sub.currency),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: event.isPaid
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                    : theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 4),
            // Show confirm button only when NOT paid and due/overdue
            if (!event.isPaid && (event.isToday || event.isOverdue))
              GestureDetector(
                onTap: () => ConfirmPaymentSheet.show(
                  context,
                  subscriptionId: sub.id,
                  subscriptionName: sub.name,
                  amount: sub.amount,
                  currency: sub.currency,
                ),
                child: Text(
                  l10n.actionConfirm,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            else if (event.isPaid)
              Icon(
                Icons.check_circle_outline_rounded,
                size: 16,
                color: const Color(0xFF10B981).withValues(alpha: 0.7),
              ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
