import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:najlepsza_restauracja/app/home/add_opinion/add_opinion_page_content.dart';
import 'package:najlepsza_restauracja/app/home/locals/locals_page_content.dart';
import 'package:najlepsza_restauracja/app/home/my_account/my_account_page_content.dart';

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
      appBar: AppBar(
        title: const Text('Najlepszy lokal w Toruniu'),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const LocalsPageContent();
        }
        if (currentIndex == 1) {
          return const AddOpinionPageContent();
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
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
