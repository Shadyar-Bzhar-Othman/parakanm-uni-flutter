import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/types.dart';
import 'package:parakanm_uni/widgets/custom_tab_button.dart';
import 'package:parakanm_uni/widgets/pie_transaction_chart.dart';
import 'package:parakanm_uni/widgets/transaction_card.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  int type = 1;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> userTransactions = getCurrentUserTransactions();

    if (userTransactions.isEmpty) {
      return const Center(
        child: Text(
          "No transactions yet to analyze",
          style: TextStyle(
            color: darkGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    List<Map<String, dynamic>> filteredTransactions =
        userTransactions.where((transaction) {
      if (type == 1) {
        return transaction["type"] == TransactionType.income;
      } else {
        return transaction["type"] == TransactionType.expense;
      }
    }).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          PieTransactionChart(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTabButton(
                text: "Income",
                isSelected: type == 1,
                onTap: () {
                  setState(() {
                    type = 1;
                  });
                },
                selectedColor: greenColor100,
                unselectedColor: greenColor20,
              ),
              const SizedBox(
                width: 15,
              ),
              CustomTabButton(
                text: "Expense",
                isSelected: type == 2,
                onTap: () {
                  setState(() {
                    type = 2;
                  });
                },
                selectedColor: redColor100,
                unselectedColor: redColor20,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredTransactions.length,
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
