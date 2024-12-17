import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/helpers.dart';
import 'package:parakanm_uni/utils/validators.dart';
import 'package:parakanm_uni/widgets/custom_button.dart';
import 'package:parakanm_uni/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String? currentPassword;
  String? newPassword;

  void updatePassword(BuildContext context) {
    final bool isValidate = formController.currentState!.validate();

    if (!isValidate) {
      return;
    }

    formController.currentState!.save();

    if (currentPassword!.trim() != currentUser["password"].trim()) {
      addSnackbar(context, "Wrong password");
      return;
    }

    for (var user in accounts) {
      if (user["email"] == currentUser["email"]) {
        user["password"] = newPassword;
        currentUser["password"] = newPassword;
        break;
      }
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                key,
                width: 225,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                "Change Password",
                style: TextStyle(
                  color: textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Form(
                key: formController,
                child: Column(
                  children: [
                    CustomTextField(
                      text: "Current Password",
                      iconPath: passwordIcon,
                      onValidate: validatePassword,
                      onSave: (value) {
                        currentPassword = value;
                      },
                      isObsecureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      text: "New Password",
                      iconPath: passwordIcon,
                      onValidate: validatePassword,
                      onSave: (value) {
                        newPassword = value;
                      },
                      isObsecureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Update Password",
                      onTap: () {
                        updatePassword(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
