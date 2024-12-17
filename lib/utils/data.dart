import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/types.dart';

Map<String, dynamic> currentUser = {};

List<Map<String, dynamic>> accounts = [
  {
    "id": 1,
    "name": "Shadyar",
    "email": "shadyar@gmail.com",
    "password": "12121212",
  },
  {
    "id": 2,
    "name": "Lava",
    "email": "lava@gmail.com",
    "password": "12121212",
  },
  {
    "id": 3,
    "name": "Hezha",
    "email": "hezha@gmail.com",
    "password": "12121212",
  },
];

List<Map<String, dynamic>> categories = [
  {
    "id": 1,
    "name": "Shopping",
    "icon": shoppingIcon,
  },
  {
    "id": 2,
    "name": "Food",
    "icon": foodIcon,
  },
  {
    "id": 3,
    "name": "Transport",
    "icon": transportIcon,
  },
  {
    "id": 4,
    "name": "Health",
    "icon": healthIcon,
  },
  {
    "id": 5,
    "name": "Education",
    "icon": educationIcon,
  },
  {
    "id": 6,
    "name": "Entertainment",
    "icon": entertainmentIcon,
  },
  {
    "id": 7,
    "name": "Others",
    "icon": othersIcon,
  }
];

List<Map<String, dynamic>> transactions = [
  {
    "id": 1,
    "userId": 2,
    "categoryId": 1,
    "type": TransactionType.income,
    "title": "Shopping",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 100000,
    "date": "2022-01-01",
  },
  {
    "id": 2,
    "userId": 2,
    "categoryId": 2,
    "type": TransactionType.expense,
    "title": "Food",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 20000,
    "date": "2022-01-02",
  },
  {
    "id": 3,
    "userId": 2,
    "categoryId": 3,
    "type": TransactionType.income,
    "title": "Transport",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 5000,
    "date": "2022-01-03",
  },
  {
    "id": 4,
    "userId": 2,
    "categoryId": 4,
    "type": TransactionType.income,
    "title": "Health",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 30000,
    "date": "2022-01-04",
  },
  {
    "id": 5,
    "userId": 2,
    "categoryId": 5,
    "type": TransactionType.expense,
    "title": "Education",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 40000,
    "date": "2022-01-05",
  },
  {
    "id": 6,
    "userId": 2,
    "categoryId": 6,
    "type": TransactionType.expense,
    "title": "Entertainment",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 60000,
    "date": "2022-01-06",
  },
  {
    "id": 7,
    "userId": 2,
    "categoryId": 7,
    "type": TransactionType.income,
    "title": "Others",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 70000,
    "date": "2022-01-07",
  },
  {
    "id": 8,
    "userId": 2,
    "categoryId": 1,
    "type": TransactionType.income,
    "title": "Shopping",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 100000,
    "date": "2022-01-08",
  },
  {
    "id": 9,
    "userId": 2,
    "categoryId": 2,
    "type": TransactionType.income,
    "title": "Food",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 20000,
    "date": "2022-01-09",
  },
  {
    "id": 10,
    "userId": 2,
    "categoryId": 3,
    "type": TransactionType.income,
    "title": "Transport",
    "details":
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
    "amount": 5000,
    "date": "2022-01-10",
  },
];

List<Map<String, dynamic>> getCurrentUserTransactions() {
  if (currentUser.isEmpty || !currentUser.containsKey("id")) {
    return [];
  }

  return transactions
      .where((transaction) => transaction["userId"] == currentUser["id"])
      .toList();
}

double getIncomePercentage() {
  final userTransactions = getCurrentUserTransactions();
  final totalAmount = userTransactions.fold<int>(
      0, (sum, transaction) => sum + transaction["amount"] as int);
  final incomeAmount = userTransactions
      .where((transaction) => transaction["type"] == TransactionType.income)
      .fold<int>(0, (sum, transaction) => sum + transaction["amount"] as int);
  return totalAmount == 0 ? 0 : (incomeAmount / totalAmount) * 100;
}

double getExpensePercentage() {
  final userTransactions = getCurrentUserTransactions();
  final totalAmount = userTransactions.fold<int>(
      0, (sum, transaction) => sum + transaction["amount"] as int);
  final expenseAmount = userTransactions
      .where((transaction) => transaction["type"] == TransactionType.expense)
      .fold<int>(0, (sum, transaction) => sum + transaction["amount"] as int);
  return totalAmount == 0 ? 0 : (expenseAmount / totalAmount) * 100;
}
