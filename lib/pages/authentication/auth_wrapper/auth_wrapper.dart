import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_tracker/domain/authentication/firebase_auth_repo.dart';
import 'package:gym_tracker/pages/authentication/auth_screens/initial_auth_screen.dart';

import '../auth_screens/login/login_screen.dart';

class AuthWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authProvider = watch(firebaseAuthRepoProvider);

    return StreamBuilder(
      stream: _authProvider.getCurrentSignedInUserStream(),
      builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
        if (userSnapshot.data == null) {
          return InitialAuthScreen();
        } else
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Logged In - HomeScreen"),
                  TextButton(
                    child: Text("log out"),
                    onPressed: () async =>
                        context.read(firebaseAuthRepoProvider).logOut(),
                  )
                ],
              ),
            ),
          ); // HomeScreen();
      },
    );
  }
}