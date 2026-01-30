import 'package:expenses_tracker/features/expenses/domain/entities/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/presentation/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('testing the expense card', (tester) async {
    // arange
    final expense = ExpenseEntity(
      id: '212',
      title: 'kisrata',
      description: 'sjkbdf',
      cost: 100,
      color: 0xFF000000,
      date: DateTime.now(),
    );
    // act
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: ExpenseCard(expense: expense, index: 0)),
        ),
      ),
    );
    // assert
    expect(find.text('kisrata'), findsOneWidget);
    expect(find.textContaining('100'), findsOneWidget);
  });
}
