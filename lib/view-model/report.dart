import 'package:flutter/material.dart';

class ReportNotifier with ChangeNotifier {
  final _expenseMonthly = [
    {
      'label': 'week 1',
      'expenses': [
        {'title': 'Groceries', 'amount': 45000},
        {'title': 'Data', 'amount': 5000},
        {'title': 'Transportation', 'amount': 7500},
        {'title': 'Entertainment', 'amount': 90000},
      ]
    },
    {
      'label': 'week 2',
      'expenses': [
        {'title': 'Data', 'amount': 15000},
        {'title': 'Transportation', 'amount': 19500},
        {'title': 'Entertainment', 'amount': 20000},
        {'title': 'Misc', 'amount': 45000},
      ]
    },
    {
      'label': 'week 3',
      'expenses': [
        {'title': 'Groceries', 'amount': 10000},
        {'title': 'Data', 'amount': 15000},
        {'title': 'Transportation', 'amount': 7500},
        {'title': 'House rent', 'amount': 35000},
      ]
    },
    {
      'label': 'week 4',
      'expenses': [
        {'title': 'Groceries', 'amount': 45000},
        {'title': 'Data', 'amount': 5000},
        {'title': 'Transportation', 'amount': 4500},
        {'title': 'Entertainment', 'amount': 19000},
      ]
    },
  ];

  final _expense = <Map>[];

  List<Map> get expense => _expense;

  Future<void> calcMonthlyExpsense() async {
    _expense.clear();

    for (var element in _expenseMonthly) {
      var total = 0;

      for (var e in (element['expenses'] as List)) {
        total += int.parse(e['amount'].toString());
      }

      _expense.add({'label': element['label'], 'total': total});

      notifyListeners();
    }
  }

  List get expenseMonthly => _expenseMonthly;

  final _byCategory = [
    {
      'label': 'Food',
      'expenses': [
        {'title': 'Week 1', 'amount': 45000},
        {'title': 'Week 2', 'amount': 5000},
        {'title': 'Week 3', 'amount': 7500},
        {'title': 'Week 4', 'amount': 9000},
      ]
    },
    {
      'label': 'Tfare',
      'expenses': [
        {'title': 'Week 1', 'amount': 25000},
        {'title': 'Week 2', 'amount': 19500},
        {'title': 'Week 3', 'amount': 21000},
        {'title': 'Week 4', 'amount': 45000},
      ]
    },
    {
      'label': 'Data',
      'expenses': [
        {'title': 'Week 1', 'amount': 15000},
        {'title': 'Week 2', 'amount': 1500},
        {'title': 'Week 3', 'amount': 2000},
        {'title': 'Week 4', 'amount': 45000},
      ]
    },
    {
      'label': 'Misc',
      'expenses': [
        {'title': 'Week 1', 'amount': 95000},
        {'title': 'Week 2', 'amount': 19500},
        {'title': 'Week 3', 'amount': 20000},
        {'title': 'Week 4', 'amount': 45000},
      ]
    },
  ];

  Future<void> calcMonthlyCategory() async {
    _expense.clear();

    for (var element in _byCategory) {
      var total = 0;

      for (var e in (element['expenses'] as List)) {
        total += int.parse(e['amount'].toString());
      }

      _expense.add({'label': element['label'], 'total': total});

      notifyListeners();
    }
  }

  List get expenseCategory => _byCategory;

  final _labels = ['Monthly', 'By category'];

  List<String> get labels => _labels;

  var _current = 0;

  int get current => _current;

  set currentt(int i) {
    _current = i;

    notifyListeners();
  }

  void addBudget(String week, String label, String amount) {
    if (_expenseMonthly.any((e) => e['label'] == 'week $week')) {
      var d = _expenseMonthly.firstWhere((e) => e['label'] == 'week $week');

      _expenseMonthly.removeWhere((e) => e['label'] == 'week $week');

      (d['expenses'] as List).add({
        'title': label,
        'amount': int.parse(amount),
      });

      _expenseMonthly.add(d);
    } else {
      _expenseMonthly.add({
        'label': 'week $week',
        'expenses': [
          {'title': label, 'amount': int.parse(amount)},
        ]
      });
    }

    if (_byCategory.any(
        (e) => e['label'].toString().toLowerCase() == label.toLowerCase())) {
      var d = _byCategory.firstWhere(
          (e) => e['label'].toString().toLowerCase() == label.toLowerCase());

      _byCategory.removeWhere(
          (e) => e['label'].toString().toLowerCase() == label.toLowerCase());

      (d['expenses'] as List).add(
        {'title': 'Week $week', 'amount': int.parse(amount)},
      );

      _byCategory.add(d);
    } else {
      _byCategory.add(
        {
          'label': label,
          'expenses': [
            {'title': 'Week $week', 'amount': int.parse(amount)},
          ]
        },
      );
    }

    notifyListeners();
  }
}
