import 'package:expenses_tracker/features/theme/domain/repository/theme_repository.dart';

class GetThemeUseCase {
  final ThemeRepository _repo;
  GetThemeUseCase(this._repo);
  bool call() => _repo.getTheme();
}
