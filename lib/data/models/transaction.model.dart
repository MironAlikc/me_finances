class TransactionModel {
  final String id;
  final String category;
  final double amount;
  final DateTime date;
  final String comment;

  TransactionModel({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'amount': amount,
      'date': date.toIso8601String(),
      'comment': comment,
    };
  }
}

class Category {
  final String id;
  final String name;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}

class Budget {
  final String id;
  final double limit;
  final String categoryId;

  Budget({
    required this.id,
    required this.limit,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'limit': limit,
      'categoryId': categoryId,
    };
  }
}
