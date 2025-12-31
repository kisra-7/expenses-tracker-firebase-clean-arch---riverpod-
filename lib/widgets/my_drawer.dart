import 'package:expenses_tracker/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            CupertinoSwitch(
              value: ref.watch(themeProvider).isDark,
              onChanged: (val) {
                ref.watch(themeProvider.notifier).changeTheme(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
