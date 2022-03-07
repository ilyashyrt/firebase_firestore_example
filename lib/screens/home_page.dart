// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:deneme_appppp/services/firestore_service.dart';
import 'package:deneme_appppp/screens/book_list.dart';
import 'package:deneme_appppp/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(controller: nameController, icon: Icons.book,hintText: 'Book',labelText: 'Book',),
            SizedBox(height: 20),
            CustomTextField(controller: authorController, icon: Icons.person,hintText: 'Author',labelText: 'Author',),
            SizedBox(height: 20,),
            CustomTextField(controller: priceController, icon: Icons.money,hintText: 'Price',labelText: 'Price',),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              FirestoreService().addBook(nameController.text,authorController.text,priceController.text);
            }, child: Text("Add Book")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookList()));
            }, child: Text("Book List")),

          ],
        ),
      ),
    );
  }
}
