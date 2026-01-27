import 'package:expenses_tracker/features/theme/domain/repository/theme_repository.dart';

class SetThemeUseCase {
  final ThemeRepository _repo;

  SetThemeUseCase(this._repo);

  Future<void> call(bool isDark) => _repo.setTheme(isDark);
}
