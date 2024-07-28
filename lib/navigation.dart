import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_it/pages/groups/group_detail.dart';
import 'package:split_it/pages/groups/group_list.dart';
import 'package:split_it/pages/groups/new_group.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorGroupKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellGroup');
final _shellNavigatorExpenseKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellExpense');
final _shellNavigatorSettingKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSetting');

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late RouterConfig<Object> _routerConfig;
  int currentPageIndex = 0;

  ColorSeed colorSelected = ColorSeed.baseColor;

  void handleColorSelect(int value) {
    setState(() {
      colorSelected = ColorSeed.values[value];
    });
  }

  @override
  void initState() {
    super.initState();

    // the one and only GoRouter instance
    _routerConfig = GoRouter(
      initialLocation: '/group',
      navigatorKey: _rootNavigatorKey,
      routes: [
        // Stateful nested navigation based on:
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // the UI shell
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            // first branch (Group)
            StatefulShellBranch(
              navigatorKey: _shellNavigatorGroupKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/group',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: GroupList(
                        colorSelected: colorSelected,
                        handleColorSelect: handleColorSelect),
                  ),
                  routes: [
                    // child route
                    GoRoute(
                        path: 'details',
                        builder: (context, state) {
                          String id = state.extra as String;
                          return GroupDetail(groupDocId: id);
                        }),
                  ],
                ),
              ],
            ),
            // second branch (Expense)
            StatefulShellBranch(
              navigatorKey: _shellNavigatorExpenseKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/expense',
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.notifications_sharp),
                              title: Text('Notification 1'),
                              subtitle: Text('This is a notification'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.notifications_sharp),
                              title: Text('Notification 2'),
                              subtitle: Text('This is a notification'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // third branch (Setting)
            StatefulShellBranch(
              navigatorKey: _shellNavigatorSettingKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/setting',
                  pageBuilder: (context, state) => NoTransitionPage(
                      child: ListView.builder(
                    reverse: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              'Hello',
                            ),
                          ),
                        );
                      }
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            'Hi!',
                          ),
                        ),
                      );
                    },
                  )),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    // FloatingActionButton? floatingActionButtonWidget;
    // if (currentPageIndex == 0) {
    //   floatingActionButtonWidget = FloatingActionButton.extended(
    //     onPressed: () {
    //       showModalBottomSheet(
    //           useSafeArea: true,
    //           context: context,
    //           showDragHandle: true,
    //           isScrollControlled: true,
    //           builder: (context) {
    //             return NewGroup(
    //                 colorSelected: widget.colorSelected,
    //                 handleColorSelect: widget.handleColorSelect);
    //           });
    //     },
    //     label: Text(AppLocalizations.of(context)!.addNewGroup),
    //     icon: const Icon(Icons.add),
    //   );
    // } else if (currentPageIndex == 1) {
    //   floatingActionButtonWidget = FloatingActionButton.extended(
    //     onPressed: () {},
    //     label: Text(AppLocalizations.of(context)!.addNewExpense),
    //     icon: const Icon(Icons.add),
    //   );
    // }

    return MaterialApp.router(
      routerConfig: _routerConfig,
      title: 'SplitIt',
      theme: ThemeData(
          colorSchemeSeed: colorSelected.color,
          useMaterial3: true,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          colorSchemeSeed: colorSelected.color,
          useMaterial3: true,
          brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: navigationShell.currentIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.group),
            icon: const Icon(Icons.group_outlined),
            label: AppLocalizations.of(context)!.groups,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.receipt_long),
            icon: const Icon(Icons.receipt_long_outlined),
            label: AppLocalizations.of(context)!.expenses,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.settings),
            icon: const Icon(Icons.settings_outlined),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
