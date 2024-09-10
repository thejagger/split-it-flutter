import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import 'new_group.dart';

import '../expenses/new_expense.dart';

part 'group_model.g.dart';

/// A custom JsonSerializable annotation that supports decoding objects such
/// as Timestamps and DateTimes.
/// This variable can be reused between different models
const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
);

@firestoreSerializable
class Group {
  Group({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.createdBy,
    required this.sumAmount,
  });

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);

  @Id()
  final String id;

  final String name;
  final int colorValue;
  final String createdBy;
  final double? sumAmount;

  Map<String, Object?> toJson() => _$GroupToJson(this);
}

@firestoreSerializable
class Expense {
  Expense({
    required this.id,
    required this.name,
    required this.amount,
    required this.createdBy,
    required this.createdAt,
  });

  factory Expense.fromJson(Map<String, Object?> json) =>
      _$ExpenseFromJson(json);

  @Id()
  final String id;

  final String name;
  final double amount;
  final String createdBy;
  final Timestamp createdAt;

  Map<String, Object?> toJson() => _$ExpenseToJson(this);
}

@Collection<Group>('groups')
@Collection<Expense>('groups/*/expenses')
final groupsRef = GroupCollectionReference();

class GroupList extends StatefulWidget {
  const GroupList(
      {super.key,
      required this.colorSelected,
      required this.handleColorSelect});

  final ColorSeed colorSelected;
  final void Function(int) handleColorSelect;

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  void openDeleteItemDialog(BuildContext context, String docId) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(AppLocalizations.of(context)!.groupDeleteItemTitle),
        actions: <Widget>[
          TextButton(
            child: Text(AppLocalizations.of(context)!.cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: Text(AppLocalizations.of(context)!.delete),
            onPressed: () {
              Navigator.of(context).pop();
              groupsRef.doc(docId).delete().then(
                    (doc) => debugPrint("Document deleted"),
                    onError: (e) => debugPrint("Error updating document $e"),
                  );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FirestoreBuilder<GroupQuerySnapshot>(
            ref: groupsRef,
            builder: (context, AsyncSnapshot<GroupQuerySnapshot> snapshot,
                Widget? child) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(AppLocalizations.of(context)!.groupEntriesError,
                        style: Theme.of(context).textTheme.headlineMedium));
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    value: null,
                  ),
                );
              }

              // Access the QuerySnapshot
              GroupQuerySnapshot querySnapshot = snapshot.requireData;

              return ListView.builder(
                itemCount: querySnapshot.docs.length,
                itemBuilder: (context, index) {
                  // Access the Group instance
                  Group group = querySnapshot.docs[index].data;

                  var colorSeedValue = Color(group.colorValue);

                  double sumAmount = group.sumAmount ?? 0.0;
                  var formatSumAmount = "€${sumAmount.toStringAsFixed(2)}";

                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 8,
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          surfaceTintColor: colorSeedValue,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(12.0),
                              onTap: () {
                                GoRouter.of(context).go(
                                    "/group/details?groupDocId=${group.id}");
                              },
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 10),
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: MenuAnchor(
                                              builder:
                                                  (context, controller, child) {
                                                return IconButton(
                                                  icon: const Icon(
                                                      Icons.more_vert),
                                                  onPressed: () {
                                                    if (controller.isOpen) {
                                                      controller.close();
                                                    } else {
                                                      controller.open();
                                                    }
                                                  },
                                                );
                                              },
                                              menuChildren: [
                                                MenuItemButton(
                                                  closeOnActivate: true,
                                                  onPressed: () =>
                                                      openDeleteItemDialog(
                                                          context, group.id),
                                                  trailingIcon:
                                                      const Icon(Icons.delete),
                                                  child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .delete),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          group.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          formatSumAmount,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      )
                                    ],
                                  )))));
                },
              );
            }),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                useSafeArea: true,
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (context) {
                  return const NewGroup();
                });
          },
          label: Text(AppLocalizations.of(context)!.addNewGroup),
          icon: const Icon(Icons.add),
        ));
  }
}

class GroupDetail extends StatefulWidget {
  const GroupDetail(
      {super.key, required this.handleColorSelect, required this.groupDocId});

  final void Function(int) handleColorSelect;
  final String groupDocId;

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  void openDeleteItemDialog(BuildContext context, String docId) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(AppLocalizations.of(context)!.expenseDeleteItemTitle),
        actions: <Widget>[
          TextButton(
            child: Text(AppLocalizations.of(context)!.cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: Text(AppLocalizations.of(context)!.delete),
            onPressed: () {
              Navigator.of(context).pop();
              groupsRef.doc(widget.groupDocId).expenses.doc(docId).delete().then(
                    (doc) => debugPrint("Document deleted"),
                    onError: (e) => debugPrint("Error updating document $e"),
                  );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<GroupDocumentSnapshot>(
        // Access a specific document
        ref: groupsRef.doc(widget.groupDocId),
        builder: (context, AsyncSnapshot<GroupDocumentSnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong!');
          if (!snapshot.hasData) return Text('Loading group...');

          // Access the GroupDocumentSnapshot
          GroupDocumentSnapshot documentSnapshot = snapshot.requireData;

          if (!documentSnapshot.exists) {
            return Text('Group does not exist.');
          }

          Group group = documentSnapshot.data!;

          var colorSeedValue = Color(group.colorValue);

          return Scaffold(
              appBar: AppBar(
                  leading: const BackButton(),
                  title: Text(group.name),
                  centerTitle: true),
              body: FirestoreBuilder<ExpenseQuerySnapshot>(
                  ref: groupsRef.doc(group.id).expenses,
                  builder: (context,
                      AsyncSnapshot<ExpenseQuerySnapshot> snapshot,
                      Widget? child) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text(
                              AppLocalizations.of(context)!.groupEntriesError,
                              style:
                                  Theme.of(context).textTheme.headlineMedium));
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          value: null,
                        ),
                      );
                    }

                    // Access the QuerySnapshot
                    ExpenseQuerySnapshot querySnapshot = snapshot.requireData;

                    return ListView.builder(
                        itemCount: querySnapshot.docs.length,
                        itemBuilder: (context, index) {
                          // Access the Expense instance
                          Expense expense = querySnapshot.docs[index].data;

                          var formatAmount =
                              "€${expense.amount.toStringAsFixed(2)}";
                          // Timestamp createdAtTS = ds.get("createdAt");
                          // var createdAtDT = createdAtTS.toDate();

                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  elevation: 8,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainer,
                                  surfaceTintColor: colorSeedValue,
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(12.0),
                                      onTap: () {
                                        GoRouter.of(context).go(
                                            "/group/details/expense?groupDocId=${group.id}&expenseDocId=${expense.id}");
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 5, 10),
                                          child: Column(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: MenuAnchor(
                                                      builder: (context,
                                                          controller, child) {
                                                        return IconButton(
                                                          icon: const Icon(
                                                              Icons.more_vert),
                                                          onPressed: () {
                                                            if (controller
                                                                .isOpen) {
                                                              controller
                                                                  .close();
                                                            } else {
                                                              controller.open();
                                                            }
                                                          },
                                                        );
                                                      },
                                                      menuChildren: [
                                                        MenuItemButton(
                                                          closeOnActivate: true,
                                                          onPressed: () =>
                                                              openDeleteItemDialog(
                                                                  context,
                                                                  expense.id),
                                                          trailingIcon:
                                                              const Icon(
                                                                  Icons.delete),
                                                          child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .delete),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  expense.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  formatAmount,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                ),
                                              )
                                            ],
                                          )))));
                        });
                  }),
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    showModalBottomSheet(
                        useSafeArea: true,
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        builder: (context) {
                          return NewExpense(groupDocId: group.id);
                        });
                  },
                  label: Text(AppLocalizations.of(context)!.addNewExpense),
                  icon: const Icon(Icons.add)));
        });
  }
}
