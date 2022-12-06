import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:najlepsza_restauracja/app/features/home/add_opinion/add_opinion_page_content.dart';
import 'package:najlepsza_restauracja/app/features/home/locals/locals_page_content.dart';
import 'package:najlepsza_restauracja/app/features/home/my_account/my_account_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Najlepszy lokal w Toruniu',
          style: TextStyle(
            color: Colors.orangeAccent,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/pancakess.jpg'), fit: BoxFit.fill),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Builder(builder: (context) {
          if (currentIndex == 0) {
            return const LocalsPageContent();
          }
          if (currentIndex == 1) {
            return AddOpinionPageContent(onSave: () {
              setState(() {
                currentIndex = 0;
              });
            });
          }
          return MyAccountPageContent(email: widget.user.email);
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        selectedLabelStyle: const TextStyle(color: Colors.orange),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        backgroundColor: Colors.deepPurple,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.reviews,
            ),
            label: 'Opinie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dodaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
