// lib/features/expenses/presentation/widgets/expense_card.dart
import 'package:expenses_tracker/features/expenses/domain/entities/expense_entitiy.dart';
import 'package:expenses_tracker/features/expenses/presentation/controllers/expensses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseCard extends ConsumerWidget {
  final ExpenseEntity expense;
  final int index;

  const ExpenseCard({super.key, required this.expense, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onLongPress: () {
        ref.read(expenseControllerProvider.notifier).deleteExpense(index);
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Color(expense.color),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              expense.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '${expense.cost.toStringAsFixed(0)} OMR',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
