import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/theme_controller.dart';

class ThemeCard extends ConsumerWidget {
  const ThemeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeControllerProvider);

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal[400],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wb_sunny_outlined),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          CupertinoSwitch(
            value: isDark,
            onChanged: (value) {
              ref.read(themeControllerProvider.notifier).setThemeData(value);
            },
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          const Icon(Icons.dark_mode_outlined),
        ],
      ),
    );
  }
}
