import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.onValidate,
    required this.onSave,
    this.iconPath = "",
    this.keyboardType = TextInputType.text,
    this.isObsecureText = false,
  });

  final String text;
  final String iconPath;
  final String? Function(String? value) onValidate;
  final void Function(String? value) onSave;
  final TextInputType keyboardType;
  final bool isObsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: greyColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        hintText: text,
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
      validator: onValidate,
      onSaved: onSave,
      keyboardType: keyboardType,
      obscureText: isObsecureText,
    );
  }
}
