import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/types.dart';
import 'package:parakanm_uni/utils/utils.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({
    super.key,
    required this.transaction,
  });

  final Map<String, dynamic> transaction;

  Map<String, dynamic> getTransactionCategory(int id) {
    return categories.firstWhere((element) => element["id"] == id);
  }

  @override
  Widget build(BuildContext context) {
    final category = getTransactionCategory(transaction['categoryId']);

    return Scaffold(
      appBar: AppBar(
        title: Text(transaction['title'] ?? 'Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction['date'],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: transaction['type'] == TransactionType.income
                        ? greenColor20
                        : redColor20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      getTransactionCategory(transaction["categoryId"])["icon"],
                      height: 35,
                      width: 35,
                      colorFilter: ColorFilter.mode(
                        transaction['type'] == TransactionType.income
                            ? greenColor60
                            : redColor60,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              transaction['details'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Divider(),
            Text(
              getAmountText(transaction['amount']),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
