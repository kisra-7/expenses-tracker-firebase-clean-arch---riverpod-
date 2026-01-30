import 'mocks/mock_expense_repository.dart';
import 'package:expenses_tracker/features/expenses/domain/entities/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/domain/usecases/get_expenses_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late MockExpenseRepository mockRepo;
  late GetExpensesUseCase useCase;

  setUp(() {
    mockRepo = MockExpenseRepository();
    useCase = GetExpensesUseCase(mockRepo);
  });

  test('test return list from expenses repositroy', () async {
    //Arange
    final expenses = [
      ExpenseEntity(
        id: '4234',
        title: '3424',
        description: 'description',
        cost: 234.0,
        color: 0xFF000000,
        date: DateTime.now(),
      ),
    ];
    // Act
    when(() => mockRepo.getExpensses()).thenAnswer((_) async => expenses);

    final result = await useCase();

    // Assert
    expect(result, expenses);
    verify(() => mockRepo.getExpensses()).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
