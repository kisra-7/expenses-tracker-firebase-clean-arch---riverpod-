// lib/features/expenses/data/dtos/expense_dto.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_tracker/features/expenses/domain/entities/expense_entitiy.dart';

class ExpenseDto {
  final String id;
  final String title;
  final String description;
  final double cost;
  final int color;
  final DateTime date;

  const ExpenseDto({
    required this.id,
    required this.title,
    required this.description,
    required this.cost,
    required this.color,
    required this.date,
  });

  factory ExpenseDto.fromFirestoreDoc(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    final rawDate = data['date'];

    DateTime parsedDate;
    if (rawDate is Timestamp) {
      parsedDate = rawDate.toDate();
    } else if (rawDate is String) {
      parsedDate = DateTime.tryParse(rawDate) ?? DateTime.now();
    } else {
      parsedDate = DateTime.now();
    }

    return ExpenseDto(
      id: doc.id, // important: use firestore doc id
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      cost: (data['cost'] as num?)?.toDouble() ?? 0.0,
      color: (data['color'] as num?)?.toInt() ?? 0,
      date: parsedDate,
    );
  }

  Map<String, dynamic> toFirestoreMap({required String creatorUid}) {
    return {
      'title': title,
      'description': description,
      'color': color,
      'cost': cost,
      'creator': creatorUid,
      'date': date,
      // keep your original key too (optional). Firestore doc id is enough.
      'id': id,
    };
  }

  ExpenseEntity toEntity() => ExpenseEntity(
    id: id,
    title: title,
    description: description,
    cost: cost,
    color: color,
    date: date,
  );

  factory ExpenseDto.fromEntity(ExpenseEntity e) => ExpenseDto(
    id: e.id,
    title: e.title,
    description: e.description,
    cost: e.cost,
    color: e.color,
    date: e.date,
  );
}
