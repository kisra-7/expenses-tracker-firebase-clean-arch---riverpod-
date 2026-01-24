import 'package:expenses_tracker/features/expenses/data/data%20source/firebase_data_source.dart';
import 'package:expenses_tracker/features/expenses/data/dto/expense_dto.dart';
import 'package:expenses_tracker/features/expenses/domain/entitiy/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/domain/repositroy/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final FirebaseDataSource _remote;

  ExpenseRepositoryImpl(this._remote);

  @override
  Future<void> addExpense(ExpenseEntity expense) async {
    await _remote.addExpenses(ExpenseDto.fromEntity(expense));
  }

  @override
  Future<void> deleteExpense(int index) async {
    await _remote.deleteExpense(index);
  }

  @override
  Future<List<ExpenseEntity>> getExpensses() async {
    final list = await _remote.getExpenses();
    return list.map((e) {
      return e.toEntity();
    }).toList();
  }
}
