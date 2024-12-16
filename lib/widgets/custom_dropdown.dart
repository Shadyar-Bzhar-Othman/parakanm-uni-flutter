import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.onSaved,
    this.iconPath = "",
    this.hintText = "",
  });

  final List<DropdownMenuItem<int>> items;
  final void Function(int? value) onChanged;
  final void Function(int? value) onSaved;
  final String iconPath;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        filled: true,
        fillColor: greyColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: darkGreyColor,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        labelStyle: TextStyle(
          color: blackColor,
          fontSize: 14,
        ),
        prefixIcon: iconPath == ""
            ? null
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                ),
              ),
      ),
      items: items,
      onChanged: onChanged,
      onSaved: (value) => onSaved(value),
    );
  }
}
