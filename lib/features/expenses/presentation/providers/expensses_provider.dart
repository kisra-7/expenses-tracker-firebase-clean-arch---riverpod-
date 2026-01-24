import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_tracker/features/auth/presentation/providers/auth_providers.dart';
import 'package:expenses_tracker/features/expenses/data/data%20source/firebase_data_source.dart';
import 'package:expenses_tracker/features/expenses/data/repository/expense_repository_impl.dart';
import 'package:expenses_tracker/features/expenses/domain/use%20cases/add_expense_use_case.dart';
import 'package:expenses_tracker/features/expenses/domain/use%20cases/delete_expense_use_case.dart';
import 'package:expenses_tracker/features/expenses/domain/use%20cases/get_expenses_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseStoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});

final firebaseDataSourceProvider = Provider((ref) {
  return FirebaseDataSource(
    ref.read(firebaseAuthProvider),
    ref.read(firebaseStoreProvider),
  );
});

final expenseRepositryProvider = Provider((ref) {
  return ExpenseRepositoryImpl(ref.read(firebaseDataSourceProvider));
});

final getExpenssesUseCaseProvider = Provider((ref) {
  return GetExpensesUseCase(ref.read(expenseRepositryProvider));
});

final addExpenseUseCaseProvider = Provider((ref) {
  return AddExpenseUseCase(ref.read(expenseRepositryProvider));
});

final deleteExpenseUseCaseProvider = Provider((ref) {
  return DeleteExpenseUseCase(ref.read(expenseRepositryProvider));
});
