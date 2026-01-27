import 'package:expenses_tracker/features/expenses/domain/repository/expense_repository.dart';

class DeleteExpenseUseCase {
  final ExpenseRepository _repo;

  DeleteExpenseUseCase(this._repo);

  Future<void> call(int index) => _repo.deleteExpense(index);
}
