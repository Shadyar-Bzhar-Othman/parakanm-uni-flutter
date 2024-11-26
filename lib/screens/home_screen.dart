import 'package:flutter/material.dart';
import 'package:parakanm_uni/widgets/account_balance_section.dart';
import 'package:parakanm_uni/widgets/transaction_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const AccountBalanceSection(),
          const SizedBox(height: 20),
          const TransactionSection(),
        ],
      ),
    );
  }
}
