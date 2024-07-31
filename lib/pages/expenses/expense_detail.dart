import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpenseDetail extends StatefulWidget {
  const ExpenseDetail(
      {super.key, required this.handleColorSelect, required this.groupDocId, required this.expenseDocId});

  final void Function(int) handleColorSelect;
  final String groupDocId;
  final String expenseDocId;

  @override
  State<ExpenseDetail> createState() => _ExpenseDetailState();
}

class _ExpenseDetailState extends State<ExpenseDetail> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection("groups").doc(widget.groupDocId).collection("expenses").doc(widget.expenseDocId).snapshots(),
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

          Map<String, dynamic> data = snapshot.data!.data()!;

          return Scaffold(
            appBar: AppBar(
                leading: const BackButton(),
                title: Text(data["name"]),
                centerTitle: true),
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                  child: Text(data["name"],
                      style: Theme.of(context).textTheme.headlineMedium)),
            ]),
          );
        });
  }
}
