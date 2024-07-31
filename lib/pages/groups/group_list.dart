import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:split_it/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'new_group.dart';

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
  final db = FirebaseFirestore.instance;

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
              db.collection("groups").doc(docId).delete().then(
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
        body: StreamBuilder(
            stream: db.collection("groups").orderBy("name").snapshots(),
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
                      child: Text(AppLocalizations.of(context)!.groupNoEntries,
                          style: Theme.of(context).textTheme.headlineMedium));
                }

                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot? ds = snapshot.data?.docs[index];

                    if (ds == null) {
                      return const SizedBox();
                    }

                    var colorSeedValue = ColorSeed.baseColor.color;
                    if (ds["colorValue"] is int) {
                      colorSeedValue = Color(ds["colorValue"]);
                    }

                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            elevation: 8,
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            surfaceTintColor: colorSeedValue,
                            child: InkWell(
                                borderRadius: BorderRadius.circular(12.0),
                                onTap: () {
                                  GoRouter.of(context).go("/group/details?groupDocId=${ds.id}");
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
                                                builder: (context, controller,
                                                    child) {
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
                                                            context, ds.id),
                                                    trailingIcon: const Icon(
                                                        Icons.delete),
                                                    child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .delete),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        const SizedBox(height: 150),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            ds["name"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                        )
                                      ],
                                    )))));
                  },
                );
              }
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
