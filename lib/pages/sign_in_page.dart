import 'package:expenses_tracker/pages/home_page.dart';
import 'package:expenses_tracker/pages/sign_up_page.dart';
import 'package:expenses_tracker/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class SignInPage extends ConsumerWidget {
  SignInPage({super.key});
  TextEditingController emailCon = TextEditingController();

  TextEditingController passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailCon,
              decoration: InputDecoration(
                hint: Text('Email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            TextField(
              obscureText: true,
              controller: passwordCon,

              decoration: InputDecoration(
                hint: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(authProvider.notifier)
                    .signInUserWithEmailAndPassword(
                      context: context,
                      email: emailCon.text.trim(),
                      paswword: passwordCon.text.trim(),
                    );
                if (FirebaseAuth.instance.currentUser != null) {
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                }
              },
              child: Text('Sign in'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account? '),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
