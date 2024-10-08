import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'main.dart';
import 'navigation.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
              title: 'SplitIt',
              theme: ThemeData(
                  colorSchemeSeed: ColorSeed.baseColor.color,
                  useMaterial3: true,
                  brightness: Brightness.light),
              darkTheme: ThemeData(
                  colorSchemeSeed: ColorSeed.baseColor.color,
                  useMaterial3: true,
                  brightness: Brightness.dark),
              themeMode: ThemeMode.system,
              home: SignInScreen(
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state) {
                    FirebaseFirestore.instance
                    .collection("users")
                    .doc(state.user?.uid)
                    .set({
                      "displayName": state.user?.displayName,
                      "email": state.user?.email,
                      "uid": state.user?.uid
                    }, SetOptions(merge: true));
                  }),
                ],
                providers: [
                  EmailAuthProvider(),
                  GoogleProvider(clientId: clientId),
                ],
              ));
        }

        return const NavigationScreen();
      },
    );
  }
}
