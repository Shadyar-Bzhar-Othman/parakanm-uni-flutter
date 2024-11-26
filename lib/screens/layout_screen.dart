import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parakanm_uni/screens/add_screen.dart';
import 'package:parakanm_uni/screens/analysis_screen.dart';
import 'package:parakanm_uni/screens/home_screen.dart';
import 'package:parakanm_uni/screens/setting_screen.dart';
import 'package:parakanm_uni/screens/transaction_screen.dart';
import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedPage = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const TransactionScreen(),
    const AddScreen(),
    const AnalysisScreen(),
    const SettingScreen(),
  ];

  Widget buildNavBarItem(String icon, String label, int index) {
    return InkWell(
      splashColor: primaryColor40,
      onTap: () {
        setState(() {
          selectedPage = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              icon,
              colorFilter: selectedPage == index
                  ? ColorFilter.mode(primaryColor100, BlendMode.srcIn)
                  : ColorFilter.mode(primaryColor40, BlendMode.srcIn),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: selectedPage == index ? primaryColor100 : primaryColor40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

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
      body: pages[selectedPage],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipOval(
        child: Material(
          color: primaryColor100,
          elevation: 10,
          child: InkWell(
            overlayColor: WidgetStateProperty.all(primaryColor40),
            splashColor: primaryColor40,
            child: SizedBox(
              width: 70,
              height: 70,
              child: SvgPicture.asset(
                addIcon,
                colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcOut),
              ),
            ),
            onTap: () {
              setState(() {
                selectedPage = 2;
              });
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: backgroundColor,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(homeIcon, "Home", 0),
            buildNavBarItem(transactionIcon, "Transactions", 1),
            const SizedBox(width: 20),
            buildNavBarItem(analysisIcon, "Analysis", 3),
            buildNavBarItem(settingIcon, "Settings", 4),
          ],
        ),
      ),
    );
  }
}
