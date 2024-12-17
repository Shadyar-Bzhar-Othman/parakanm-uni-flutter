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

List<Map<String, dynamic>> transactions = [];

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
