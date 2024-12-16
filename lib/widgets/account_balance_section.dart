import 'package:flutter/widgets.dart';
import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/types.dart';
import 'package:parakanm_uni/utils/utils.dart';
import 'package:parakanm_uni/widgets/balance_card.dart';

class AccountBalanceSection extends StatelessWidget {
  const AccountBalanceSection({super.key});

  int getTotalAmount() {
    double totalAmount = 0;

    for (int i = 0; i < transactions.length; i++) {
      totalAmount += transactions[i]['amount'];
    }

    return totalAmount.toInt();
  }

  int getTotalIncomes() {
    double totalIncomes = 0;

    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i]["type"] == TransactionType.income) {
        totalIncomes += transactions[i]['amount'];
      }
    }

    return totalIncomes.toInt();
  }

  int getTotalExpenses() {
    double totalExpenses = 0;

    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i]["type"] == TransactionType.expense) {
        totalExpenses += transactions[i]['amount'];
      }
    }

    return totalExpenses.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Account Balance",
          style: TextStyle(
            color: lightColor20,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          getAmountText(getTotalAmount()),
          style: TextStyle(
            color: textColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BalanceCard(
              color: greenColor100,
              icon: incomeIcon,
              title: "Income",
              amount: getAmountText(getTotalIncomes()),
            ),
            BalanceCard(
              color: redColor100,
              icon: expenseIcon,
              title: "Expense",
              amount: getAmountText(getTotalExpenses()),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
