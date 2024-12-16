import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/widgets/transaction_card.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> userTransactions = getCurrentUserTransactions();

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
          userTransactions.isEmpty
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
                  itemCount: userTransactions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TransactionCard(
                      transaction: userTransactions[index],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
