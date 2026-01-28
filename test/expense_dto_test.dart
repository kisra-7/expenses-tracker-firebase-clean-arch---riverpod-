import 'package:flutter_test/flutter_test.dart';
import 'package:expenses_tracker/features/expenses/data/dto/expense_dto.dart';
import 'package:expenses_tracker/features/expenses/domain/entitiy/expense_entitiy.dart';

void main() {
  test('testing entity <--> dto mapping', () {
    // arrange
    final entity = ExpenseEntity(
      id: '233',
      title: '323',
      description: '323',
      cost: 32,
      color: 0xFF000000,
      date: DateTime.now(),
    );
    // act
    final dto = ExpenseDto.fromEntity(entity);
    final mappedBack = dto.toEntity();
    //assert

    expect(entity.id, mappedBack.id);
    expect(entity.cost, mappedBack.cost);
  });
}
