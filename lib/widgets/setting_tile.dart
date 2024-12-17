import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parakanm_uni/utils/colors.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        icon,
        height: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
