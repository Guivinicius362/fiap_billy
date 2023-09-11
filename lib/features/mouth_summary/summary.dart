class Summary {
  final Expenses expenses;
  final Incomes incomes;

  Summary({required this.expenses, required this.incomes});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      expenses: Expenses.fromJson(json['summary']['expenses']),
      incomes: Incomes.fromJson(json['summary']['incomes']),
    );
  }
}

class Expenses {
  final List<ExpenseItem> items;
  final int total;

  Expenses({required this.items, required this.total});

  factory Expenses.fromJson(Map<String, dynamic> json) {
    var itemList = json['items'] as List;
    List<ExpenseItem> expenseItems =
        itemList.map((item) => ExpenseItem.fromJson(item)).toList();

    return Expenses(
      items: expenseItems,
      total: json['total'],
    );
  }
}

class ExpenseItem {
  final int value;
  final String date;
  final String bank;
  final String bankImage;

  ExpenseItem({
    required this.value,
    required this.date,
    required this.bank,
    required this.bankImage,
  });

  factory ExpenseItem.fromJson(Map<String, dynamic> json) {
    return ExpenseItem(
      value: json['value'],
      date: json['date'],
      bank: json['bank'],
      bankImage: json['bankImage'],
    );
  }
}

class Incomes {
  final List<IncomeItem> items;
  final int total;

  Incomes({required this.items, required this.total});

  factory Incomes.fromJson(Map<String, dynamic> json) {
    var itemList = json['items'] as List;
    List<IncomeItem> incomeItems =
        itemList.map((item) => IncomeItem.fromJson(item)).toList();

    return Incomes(
      items: incomeItems,
      total: json['total'],
    );
  }
}

class IncomeItem {
  final int value;
  final String date;
  final String bank;
  final String bankImage;

  IncomeItem({
    required this.value,
    required this.date,
    required this.bank,
    required this.bankImage,
  });

  factory IncomeItem.fromJson(Map<String, dynamic> json) {
    return IncomeItem(
      value: json['value'],
      date: json['date'],
      bank: json['bank'],
      bankImage: json['bankImage'],
    );
  }
}
