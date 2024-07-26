import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  //final dbRef = FirebaseFirestore.instance.collection('Group').get();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("groups").orderBy("name").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text(
              'No Data...',
            );
          } else {
            //List<QueryDocumentSnapshot<Map<String, dynamic>>>? items = snapshot.data?.docs;
            //return const ListTile(title: Text('hans'));

            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot? ds = snapshot.data?.docs[index];

                return Card(
                  child: ListTile(
                    title: Text(ds?["name"]),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
            );
          }
        });
  }
}
