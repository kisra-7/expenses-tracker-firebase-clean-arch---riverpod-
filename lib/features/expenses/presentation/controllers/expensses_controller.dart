import 'package:expenses_tracker/features/expenses/domain/entities/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/presentation/providers/expenses_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseControllerProvider =
    AsyncNotifierProvider<ExpenssesController, List<ExpenseEntity>>(
      ExpenssesController.new,
    );

class ExpenssesController extends AsyncNotifier<List<ExpenseEntity>> {
  @override
  Future<List<ExpenseEntity>> build() async {
    final getExpensses = ref.read(getExpenssesUseCaseProvider);
    return getExpensses();
  }

  Future<void> refreshExpense() async {
    final getExpense = ref.read(getExpenssesUseCaseProvider);
    state = AsyncLoading();
    state = await AsyncValue.guard(() => getExpense());
  }

  Future<void> addExpense(ExpenseEntity expense) async {
    final add = ref.read(addExpenseUseCaseProvider);
    await add(expense);
    await refreshExpense();
  }

  Future<void> deleteExpense(int index) async {
    final delete = ref.read(deleteExpenseUseCaseProvider);
    await delete(index);
    await refreshExpense();
  }

  double sumCosts(List<ExpenseEntity> list) {
    double total = 0;
    for (ExpenseEntity e in list) {
      total += e.cost;
    }
    return total;
  }
}
