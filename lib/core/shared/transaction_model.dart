class TransactionModel {
  final String description;
  final num amount;
  final String label;
  final String date;

  TransactionModel({
    required this.description,
    required this.amount,
    required this.label,
    required this.date,
  });
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'amount': amount,
      'label': label,
      'date': date,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      description: map['description'] ?? '',
      amount: map['amount'] ?? 0,
      label: map['label'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
