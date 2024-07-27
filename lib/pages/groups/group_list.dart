import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'group_detail.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

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
    return StreamBuilder(
        stream: db.collection("groups").orderBy("name").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text(
              'No Data...',
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot? ds = snapshot.data?.docs[index];

                if (ds == null) {
                  return const SizedBox();
                }

                var colorSeedValue = ColorSeed.baseColor.color;
                if (ds["color_seed_hash"] is int) {
                  colorSeedValue = Color(ds["color_seed_hash"]);
                }

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GroupDetail(groupDocId: ds.id))),child: Card(
                        elevation: 8,
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        surfaceTintColor: colorSeedValue,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: MenuAnchor(
                                        builder: (context, controller, child) {
                                          return IconButton(
                                            icon: const Icon(Icons.more_vert),
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
                                            trailingIcon:
                                                const Icon(Icons.delete),
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .delete),
                                          ),
                                        ],
                                      ),
                                    )),
                                const SizedBox(height: 150),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    ds?["name"],
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
        });
  }
}
