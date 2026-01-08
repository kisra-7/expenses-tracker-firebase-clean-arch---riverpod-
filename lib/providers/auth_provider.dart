import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final authProvider = ChangeNotifierProvider<Auth>((ref){
  return Auth();
});

class Auth extends ChangeNotifier {


Future signInUserWithEmailAndPassword({ required BuildContext context,required String email,required String paswword})async{
try {
  final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: paswword);
// ignore: avoid_print
print(userCredential.user?.email);
}on FirebaseAuthException catch (e) {
  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
}
 }


 Future signUserEmailPasswors({required BuildContext context , required String email,required String password})async{
  try {
final userCredintials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password:password);
  // ignore: avoid_print
  print(userCredintials);
  } on FirebaseAuthException catch (e) {
   // ignore: use_build_context_synchronously
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
  }
  }
}