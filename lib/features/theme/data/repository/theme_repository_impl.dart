import 'package:expenses_tracker/features/theme/data/Data%20Source/local_data.dart';
import 'package:expenses_tracker/features/theme/domain/repository/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final LocalData _data;
  ThemeRepositoryImpl(this._data);

  @override
  bool getTheme() => _data.getThemeData();

  @override
  Future<void> setTheme(bool isDark) => _data.setThemeData(isDark);
}
