// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  DocumentReference documentReference = FirebaseFirestore.instance
  .collection('users')
  .doc();

  Future<void> addBook(String fullName,String authorName, String price) {
    // Call the user's CollectionReference to add a new user
    return books
        .add({
          'full_name': fullName,
          'author_name': authorName, // John Doe
          'price': price
        })
        .then((value) => print("Book Added"))
        .catchError((error) => print("Failed to add book: $error"));
  }

  Future<void> deleteBook(String documentId) {
    return books
        .doc(documentId)
        .delete()
        .then((value) => print("Book Deleted"))
        .catchError((error) => print("Failed to delete book: $error"));
  }
}
