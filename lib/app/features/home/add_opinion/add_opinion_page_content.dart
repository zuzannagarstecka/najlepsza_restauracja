import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var localName = '';
  var pancakeName = '';
  var rating = 4.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Podaj nazwę lokalu',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 3),
                ),
              ),
              onChanged: (newValue) {
                setState(() {
                  localName = newValue;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Podaj nazwę naleśnika',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                    width: 3,
                  ),
                ),
              ),
              onChanged: (newValue) {
                setState(() {
                  pancakeName = newValue;
                });
              },
            ),
            Slider(
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
              value: rating,
              min: 1.0,
              max: 6.0,
              divisions: 10,
              label: rating.toString(),
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.grey,
            ),
            ElevatedButton(
              onPressed: localName.isEmpty || pancakeName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('locals').add({
                        'name': localName,
                        'pancake': pancakeName,
                        'rating': rating,
                      });
                      widget.onSave();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text('Dodaj'),
            ),
          ],
        ),
      ),
    );
  }
}
