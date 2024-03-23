import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zaw_lin_htike_ap_assignment/LoginPage.dart';
import 'package:zaw_lin_htike_ap_assignment/home_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          //user is logged in
          if(snapshot.hasData) {
            return const HomeScreen();
          }
          //user is NOT logged in
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}