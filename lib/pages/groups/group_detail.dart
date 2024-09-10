import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

import '../../constants.dart';
import '../expenses/new_expense.dart';

class GroupDetail extends StatefulWidget {
  const GroupDetail(
      {super.key, required this.handleColorSelect, required this.groupDocId});

  final void Function(int) handleColorSelect;
  final String groupDocId;

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  final db = FirebaseFirestore.instance;

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
              db.collection("expenses").doc(docId).delete().then(
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
    return StreamBuilder(
        stream: db.collection("groups").doc(widget.groupDocId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(AppLocalizations.of(context)!.generalError,
                    style: Theme.of(context).textTheme.headlineMedium));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                value: null,
              ),
            );
          }

          String groupDocId = snapshot.data!.id;
          Map<String, dynamic> groupData = snapshot.data!.data()!;

          var colorSeedValue = ColorSeed.baseColor.color;
          if (groupData["colorValue"] is int) {
            colorSeedValue = Color(groupData["colorValue"]);
          }

          return Scaffold(
            appBar: AppBar(
                leading: const BackButton(),
                title: Text(groupData["name"]),
                centerTitle: true),
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              StreamBuilder(
                  stream: db
                      .collection("groups")
                      .doc(groupDocId)
                      .collection("expenses")
                      .orderBy("createdAt", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          value: null,
                        ),
                      );
                    } else {
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                            child: Text(
                                AppLocalizations.of(context)!.expenseNoEntries,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium));
                      }

                      return Expanded(
                          child: ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot? ds = snapshot.data?.docs[index];

                          if (ds == null) {
                            return const SizedBox();
                          }

                          var formatAmount =
                              "€${ds.get("amount").toStringAsFixed(2)}";
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
                                            "/group/details/expense?groupDocId=$groupDocId&expenseDocId=${ds.id}");
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
                                                                  ds.id),
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
                                              // Align(
                                              //   alignment: Alignment.bottomLeft,
                                              //   child: Text(
                                              //     intl.DateFormat(
                                              //             'dd.MM.yyyy HH:MM')
                                              //         .format(createdAtDT),
                                              //     style: Theme.of(context)
                                              //         .textTheme
                                              //         .labelLarge,
                                              //   ),
                                              // ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  ds.get("name"),
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
                        },
                      ));
                    }
                  })
            ]),
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  showModalBottomSheet(
                      useSafeArea: true,
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return NewExpense(groupDocId: snapshot.data!.id);
                      });
                },
                label: Text(AppLocalizations.of(context)!.addNewExpense),
                icon: const Icon(Icons.add)),
          );
        });
  }
}
