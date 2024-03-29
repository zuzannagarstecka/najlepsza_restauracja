import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.red],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(isCreatingAccount == true
                    ? 'Zarejestruj się'
                    : 'Zaloguj się'),
                TextField(
                  controller: widget.emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 3),
                    ),
                  ),
                ),
                TextField(
                  controller: widget.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Hasło',
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 3),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(errorMessage),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (isCreatingAccount == true) {
                      // rejestracja

                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordController.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    } else {
                      //logowanie
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: widget.emailController.text,
                            password: widget.passwordController.text);
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(isCreatingAccount == true
                      ? 'Zarejestruj się'
                      : 'Zaloguj się'),
                ),
                const SizedBox(height: 30),
                if (isCreatingAccount == false) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = true;
                      });
                    },
                    child: const Text(
                      'Utwórz konto',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
                if (isCreatingAccount == true) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = false;
                      });
                    },
                    child: const Text(
                      'Masz już konto?',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
