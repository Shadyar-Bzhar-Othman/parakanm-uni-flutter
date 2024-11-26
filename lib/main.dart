import 'package:flutter/material.dart';
import 'package:parakanm_uni/screens/layout_screen.dart';
import 'package:parakanm_uni/utils/colors.dart';

void main() {
  runApp(const ParakanmApp());
}

class ParakanmApp extends StatelessWidget {
  const ParakanmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parakanm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor100,
        ),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: const LayoutScreen(),
    );
  }
}
