import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupDetail extends StatefulWidget {
  const GroupDetail({super.key, required this.groupDocId});

  final String groupDocId;

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    final docRef = db.collection("groups").doc(widget.groupDocId);
    docRef.snapshots().listen(
          (event) => print("current data: ${event.data()}"),
          onError: (error) => print("Listen failed: $error"),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('geiloooo'),
      ),
      body: Column(
        children: [
          Text('hhaaaaans'),
          // Text(document..["name"]),
        ],
      ),
    );
  }
}
