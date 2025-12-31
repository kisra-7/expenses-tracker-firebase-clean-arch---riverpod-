import 'package:expenses_tracker/pages/home_page.dart';
import 'package:expenses_tracker/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});
  TextEditingController emialController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emialController,
              decoration: InputDecoration(
                hint: Text('Email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            TextField(
              controller: passwordController,

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
                    .signUserEmailPasswors(
                      context: context,
                      email: emialController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                if (FirebaseAuth.instance.currentUser != null) {
                  // ignore: use_build_context_synchronously
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
              child: Text('Sign UP'),
            ),
          ],
        ),
      ),
    );
  }
}
