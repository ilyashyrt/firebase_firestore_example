// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_appppp/services/firestore_service.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final Stream<QuerySnapshot> _books =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _books,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    FirestoreService().deleteBook(snapshot.data!.docs[index].reference.id);
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    leading: Text("${index+1}",style: TextStyle(fontWeight: FontWeight.bold),),
                    title: Text(snapshot.data!.docs[index]['full_name']),
                    subtitle: Text(
                        snapshot.data!.docs[index]['author_name'].toString()),
                    trailing: Text(snapshot.data!.docs[index]['price'] + " TL",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 16),),
                  ),
                );
              });
        },
      ),
    );
  }
}
