import 'package:expenses_tracker/features/theme/data/Data%20Source/local_data.dart';
import 'package:expenses_tracker/features/theme/data/repository/theme_repository_impl.dart';
import 'package:expenses_tracker/features/theme/domain/Use%20Cases/get_theme_use_case.dart';
import 'package:expenses_tracker/features/theme/domain/Use%20Cases/set_theme_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized');
});

final localDataProvider = Provider<LocalData>((ref) {
  return LocalData(ref.read(prefsProvider));
});

final themerepoProvider = Provider((ref) {
  return ThemeRepositoryImpl(ref.read(localDataProvider));
});

final getThemeUseCaseProvider = Provider<GetThemeUseCase>((ref) {
  return GetThemeUseCase(ref.read(themerepoProvider));
});

final setThemeUseCaseProvider = Provider<SetThemeUseCase>((ref) {
  return SetThemeUseCase(ref.read(themerepoProvider));
});
