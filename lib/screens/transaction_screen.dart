import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/widgets/custom_dropdown.dart';
import 'package:parakanm_uni/widgets/custom_tab_button.dart';
import 'package:parakanm_uni/widgets/transaction_card.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int? category = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> userTransactions = getCurrentUserTransactions();

    List<Map<String, dynamic>> filteredTransactions =
        userTransactions.where((transaction) {
      return category == 0 || transaction["categoryId"] == category;
    }).toList();

    List<Map<String, dynamic>> categoriesWithAll = [
      {'id': 0, 'name': 'All'},
      ...categories,
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              "Transactions",
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomTabButton(
                  text: categoriesWithAll[index]['name'],
                  isSelected: category == categoriesWithAll[index]['id'],
                  onTap: () {
                    setState(() {
                      category = categoriesWithAll[index]['id'];
                    });
                  },
                  selectedColor: greenColor100,
                  unselectedColor: greenColor20,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: categoriesWithAll.length,
            ),
          ),
          const SizedBox(height: 10),
          filteredTransactions.isEmpty
              ? Center(
                  child: Text(
                    "No transactions yet",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredTransactions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TransactionCard(
                      transaction: filteredTransactions[index],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
