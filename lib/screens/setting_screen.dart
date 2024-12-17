import 'package:flutter/material.dart';
import 'package:parakanm_uni/screens/category_screen.dart';
import 'package:parakanm_uni/screens/chnage_password_screen.dart';
import 'package:parakanm_uni/screens/login_screen.dart';
import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/widgets/setting_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(avatarBoy),
                radius: 50,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                currentUser["name"] ?? "Me",
                style: TextStyle(
                  color: textColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SettingTile(
          text: "Categories",
          icon: categoryIcon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              ),
            );
          },
        ),
        const Divider(
          height: 0,
        ),
        SettingTile(
          text: "Change Password",
          icon: lockIcon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangePasswordScreen(),
              ),
            );
          },
        ),
        const Divider(
          height: 0,
        ),
        SettingTile(
          text: "Logout",
          icon: logoutIcon,
          onTap: () {
            currentUser = {};

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
