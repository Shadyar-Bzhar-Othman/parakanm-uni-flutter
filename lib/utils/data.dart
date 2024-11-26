import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/types.dart';

const Map<String, dynamic> currentUser = {
  "id": 1,
  "name": "Shadyar",
  "email": "shadyar@gmail.com",
  "password": "12121212",
};

const List<Map<String, dynamic>> accounts = [
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

const List<Map<String, dynamic>> categories = [
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

const List<Map<String, dynamic>> transactions = [
  {
    "id": 1,
    "userId": 1,
    "categoryId": 1,
    "type": TransactionType.income,
    "title": "Shopping",
    "amount": 100000,
    "date": "2022-01-01",
  },
  {
    "id": 2,
    "userId": 1,
    "categoryId": 2,
    "type": TransactionType.expense,
    "title": "Food",
    "amount": 20000,
    "date": "2022-01-02",
  },
  {
    "id": 3,
    "userId": 1,
    "categoryId": 3,
    "type": TransactionType.income,
    "title": "Transport",
    "amount": 5000,
    "date": "2022-01-03",
  },
  {
    "id": 4,
    "userId": 1,
    "categoryId": 4,
    "type": TransactionType.income,
    "title": "Health",
    "amount": 30000,
    "date": "2022-01-04",
  },
  {
    "id": 5,
    "userId": 1,
    "categoryId": 5,
    "type": TransactionType.expense,
    "title": "Education",
    "amount": 40000,
    "date": "2022-01-05",
  },
  {
    "id": 6,
    "userId": 1,
    "categoryId": 6,
    "type": TransactionType.expense,
    "title": "Entertainment",
    "amount": 60000,
    "date": "2022-01-06",
  },
  {
    "id": 7,
    "userId": 1,
    "categoryId": 7,
    "type": TransactionType.income,
    "title": "Others",
    "amount": 70000,
    "date": "2022-01-07",
  },
  {
    "id": 8,
    "userId": 1,
    "categoryId": 1,
    "type": TransactionType.income,
    "title": "Shopping",
    "amount": 100000,
    "date": "2022-01-08",
  },
  {
    "id": 9,
    "userId": 1,
    "categoryId": 2,
    "type": TransactionType.income,
    "title": "Food",
    "amount": 20000,
    "date": "2022-01-09",
  },
  {
    "id": 10,
    "userId": 1,
    "categoryId": 3,
    "type": TransactionType.income,
    "title": "Transport",
    "amount": 5000,
    "date": "2022-01-10",
  },
];
