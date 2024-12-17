import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: primaryColor100,
        title: Text(
          "PARAKANM",
          style: TextStyle(
            color: primaryColor100,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Category Page"),
      ),
    );
  }
}
