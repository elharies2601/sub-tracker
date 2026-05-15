import 'package:flutter/material.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

/// Persistent bottom navigation shell.
/// go_router's ShellRoute keeps page state alive when switching tabs.
class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final location = GoRouterState.of(context).uri.toString();

    final tabs = [
      _TabItem(
        icon: Icons.list_alt_rounded,
        label: l10n.navSubscriptions,
        path: '/',
      ),
      _TabItem(
        icon: Icons.calendar_month_rounded,
        label: 'Calendar',
        path: '/calendar',
      ),
      _TabItem(
        icon: Icons.bar_chart_rounded,
        label: l10n.navDashboard,
        path: '/dashboard',
      ),
      _TabItem(
        icon: Icons.settings_rounded,
        label: l10n.navSettings,
        path: '/settings',
      ),
    ];

    // Determine active tab index
    int selectedIndex = 0;
    for (int i = tabs.length - 1; i >= 0; i--) {
      if (location.startsWith(tabs[i].path) &&
          (tabs[i].path != '/' || location == '/')) {
        selectedIndex = i;
        break;
      }
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (i) => context.go(tabs[i].path),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: tabs
            .map(
              (t) => NavigationDestination(icon: Icon(t.icon), label: t.label),
            )
            .toList(),
      ),
    );
  }
}

class _TabItem {
  final IconData icon;
  final String label;
  final String path;
  const _TabItem({required this.icon, required this.label, required this.path});
}
