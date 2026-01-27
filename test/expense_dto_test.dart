import 'package:flutter_test/flutter_test.dart';
import 'package:expenses_tracker/features/expenses/data/dto/expense_dto.dart';
import 'package:expenses_tracker/features/expenses/domain/entitiy/expense_entitiy.dart';

void main() {
  test('ExpenseDto <-> ExpenseEntity mapping keeps the same values', () {
    final entity = ExpenseEntity(
      id: '1',
      title: 'Coffee',
      description: 'Latte',
      cost: 1.5,
      color: 0xFF000000,
      date: DateTime(2026, 1, 27),
    );

    final dto = ExpenseDto.fromEntity(entity);
    final mappedBack = dto.toEntity();

    expect(mappedBack.id, entity.id);
    expect(mappedBack.title, entity.title);
    expect(mappedBack.description, entity.description);
    expect(mappedBack.cost, entity.cost);
    expect(mappedBack.color, entity.color);
    expect(mappedBack.date, entity.date);
  });
}
