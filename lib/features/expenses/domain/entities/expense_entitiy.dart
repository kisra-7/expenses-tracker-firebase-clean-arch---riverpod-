class ExpenseEntity {
  final String id;
  final String title;
  final String description;
  final double cost;
  final int color;
  final DateTime date;

  const ExpenseEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.cost,
    required this.color,
    required this.date,
  });
}
