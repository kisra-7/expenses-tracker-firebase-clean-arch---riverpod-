import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_tracker/features/expenses/data/dto/expense_dto.dart';
import 'package:expenses_tracker/features/expenses/domain/entities/expense_entitiy.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _store;
  FirebaseDataSource(this._auth, this._store);

  Future<List<ExpenseDto>> getExpenses() async {
    final snapShot = await _store
        .collection('expensses')
        .where('creator', isEqualTo: _auth.currentUser!.uid)
        .get();
    return snapShot.docs.map((e) {
      return ExpenseDto.fromFirestoreDoc(e);
    }).toList();
  }

  Future<void> addExpenses(ExpenseDto expenseDto) async {
    await _store
        .collection('expensses')
        .add(expenseDto.toFirestoreMap(creatorUid: _auth.currentUser!.uid));
  }

  Future<void> deleteExpense(int index) async {
    final snapShot = await _store
        .collection('expensses')
        .where('creator', isEqualTo: _auth.currentUser!.uid)
        .get();

    await _store.collection('expensses').doc(snapShot.docs[index].id).delete();
  }
}
