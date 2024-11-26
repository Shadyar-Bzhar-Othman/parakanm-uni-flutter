import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/types.dart';

class TransactionCard extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionCard({
    super.key,
    required this.transaction,
  });

  Map<String, dynamic> getTransactionCategory(int id) {
    return categories.firstWhere((element) => element["id"] == id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: transaction['type'] == TransactionType.income
                  ? greenColor20
                  : redColor20,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SvgPicture.asset(
                getTransactionCategory(transaction["categoryId"])["icon"],
                height: 40,
                width: 40,
                colorFilter: ColorFilter.mode(
                  transaction['type'] == TransactionType.income
                      ? greenColor60
                      : redColor60,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction["title"],
                style: const TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                transaction["date"],
                style: const TextStyle(
                  color: textColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
