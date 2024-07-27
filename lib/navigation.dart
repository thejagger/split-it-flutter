import 'package:flutter/material.dart';
import 'package:split_it/pages/groups/group_list.dart';
import 'package:split_it/pages/groups/new_group.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'constants.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen(
      {super.key,
      required this.colorSelected,
      required this.handleColorSelect});

  final ColorSeed colorSelected;
  final void Function(int) handleColorSelect;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    FloatingActionButton? floatingActionButtonWidget;
    if (currentPageIndex == 0) {
      floatingActionButtonWidget = FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              useSafeArea: true,
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (context) {
                return NewGroup(
                    colorSelected: widget.colorSelected,
                    handleColorSelect: widget.handleColorSelect);
              });
        },
        label: Text(AppLocalizations.of(context)!.addNewGroup),
        icon: const Icon(Icons.add),
      );
    } else if (currentPageIndex == 1) {
      floatingActionButtonWidget = FloatingActionButton.extended(
        onPressed: () {},
        label: Text(AppLocalizations.of(context)!.addNewExpense),
        icon: const Icon(Icons.add),
      );
    }

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
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
        ),
        body: <Widget>[
          /// GroupList
          const GroupList(),

          /// Notifications page
          const Padding(
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

          /// Messages page
          ListView.builder(
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
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
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
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ][currentPageIndex],
        floatingActionButton: floatingActionButtonWidget);
  }
}
