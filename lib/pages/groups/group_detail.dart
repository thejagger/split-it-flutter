import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupDetail extends StatefulWidget {
  const GroupDetail(
      {super.key, required this.handleColorSelect, required this.groupDocId});

  final void Function(int) handleColorSelect;
  final String groupDocId;

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return StreamBuilder(
        stream: db.collection("groups").doc(widget.groupDocId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong', style: Theme.of(context).textTheme.headlineMedium));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading", style: Theme.of(context).textTheme.headlineMedium));
          }

          Map<String, dynamic> data = snapshot.data!.data()!;

          return Scaffold(
              appBar: AppBar(
                  leading: const BackButton(),
                  title: Text(data["name"]),
                  centerTitle: true),
              body: Center(child: Text(data["name"], style: Theme.of(context).textTheme.headlineMedium)));
        });
  }
}
