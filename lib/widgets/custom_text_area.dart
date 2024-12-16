import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({
    super.key,
    required this.text,
    required this.onValidate,
    required this.onSave,
  });

  final String text;
  final String? Function(String? value) onValidate;
  final void Function(String? value) onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 3,
      maxLines: 5,
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
      ),
      validator: onValidate,
      onSaved: onSave,
      keyboardType: TextInputType.text,
    );
  }
}
