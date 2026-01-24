// lib/features/expenses/presentation/controllers/expense_color_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseColorController extends Notifier<Color> {
  @override
  Color build() => Colors.teal;

  void changeColor(Color selectedColor) {
    state = selectedColor;
  }
}

final expenseColorProvider = NotifierProvider<ExpenseColorController, Color>(
  ExpenseColorController.new,
);
