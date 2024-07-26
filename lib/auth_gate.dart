import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'main.dart';
import 'navigation.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({
    super.key,
    required this.colorSelected,
    required this.handleColorSelect,  
  });

  final ColorSeed colorSelected;
  final void Function(int) handleColorSelect;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: clientId),
            ],
          );
        }

        return NavigationScreen(
          colorSelected: colorSelected,
          handleColorSelect: handleColorSelect
        );
      },
    );
  }
}
