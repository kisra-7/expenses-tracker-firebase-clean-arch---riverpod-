import 'package:expenses_tracker/features/expenses/domain/entitiy/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/domain/usecases/get_expenses_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_expense_repository.dart';

void main() {
  late MockExpensesRepository mockRepo;
  late GetExpensesUseCase useCase;

  setUp(() {
    mockRepo = MockExpensesRepository();
    useCase = GetExpensesUseCase(mockRepo);
  });

  test('test return list from expenses repositroy', () async {
    final expenses = [
      ExpenseEntity(
        id: '4234',
        title: '3424',
        description: 'description',
        cost: 234,
        color: 0xFF000000,
        date: DateTime.now(),
      ),
    ];
  });
}
