import 'package:ecomtest/src/features/home/view/pages/home_screen.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreenPage extends StatelessWidget {
  const ProfileScreenPage({super.key, required this.providers});

  static const route = 'profile';

  final List<AuthProvider>? providers;

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providers: providers,
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, HomeScreenPage.route);
        }),
      ],
    );
  }
}
