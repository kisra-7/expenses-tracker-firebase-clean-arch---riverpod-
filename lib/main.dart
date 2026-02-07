import 'package:expenses_tracker/core/notifications/local_notification.dart';
import 'package:expenses_tracker/features/auth/presentation/pages/sign_in_page.dart';
import 'package:expenses_tracker/features/expenses/presentation/pages/home_page.dart';
import 'package:expenses_tracker/features/theme/presentation/controllers/theme_controller.dart';
import 'package:expenses_tracker/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/theme/presentation/providers/theme_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotification.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [prefsProvider.overrideWithValue(prefs)],
      child: const App(), // your root widget
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: FirebaseAuth.instance.currentUser != null
          ? HomePage()
          : SignInPage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeControllerProvider)
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
