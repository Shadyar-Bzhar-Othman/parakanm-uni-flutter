import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';

void addErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: redColor100,
      content: Text(
        message,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

void addSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: primaryColor100,
      content: Text(
        message,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
