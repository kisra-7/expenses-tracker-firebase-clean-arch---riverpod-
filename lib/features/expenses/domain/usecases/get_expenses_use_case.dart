import 'package:expenses_tracker/features/expenses/domain/entitiy/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/domain/repository/expense_repository.dart';

class GetExpensesUseCase {
  final ExpenseRepository _repo;
  GetExpensesUseCase(this._repo);
  Future<List<ExpenseEntity>> call() => _repo.getExpensses();
}
