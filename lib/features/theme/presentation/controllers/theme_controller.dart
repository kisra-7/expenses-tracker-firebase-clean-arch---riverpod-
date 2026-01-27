import 'package:expenses_tracker/features/theme/presentation/providers/theme_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeControllerProvider = NotifierProvider<ThemeController, bool>(
  ThemeController.new,
);

class ThemeController extends Notifier<bool> {
  @override
  bool build() {
    final isDark = ref.read(getThemeUseCaseProvider);
    return isDark();
  }

  Future<void> setThemeData(bool themeMode) async {
    state = themeMode;
    final setThemeMode = ref.read(setThemeUseCaseProvider);
    await setThemeMode(themeMode);
  }
}
