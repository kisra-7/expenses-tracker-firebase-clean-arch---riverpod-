import 'package:expenses_tracker/features/expenses/domain/entities/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/domain/repository/expense_repository.dart';

class AddExpenseUseCase {
  final ExpenseRepository _repo;
  AddExpenseUseCase(this._repo);
  Future<void> call(ExpenseEntity expense) => _repo.addExpense(expense);
}
