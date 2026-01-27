import 'package:expenses_tracker/features/expenses/domain/entitiy/expense_entitiy.dart';

abstract class ExpenseRepository {
  Future<List<ExpenseEntity>> getExpensses();

  Future<void> addExpense(ExpenseEntity expense) async {}

  Future<void> deleteExpense(int index) async {}
}
