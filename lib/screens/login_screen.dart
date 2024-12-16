import 'package:flutter/material.dart';
import 'package:parakanm_uni/screens/layout_screen.dart';
import 'package:parakanm_uni/screens/register_screen.dart';
import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/helpers.dart';
import 'package:parakanm_uni/utils/validators.dart';
import 'package:parakanm_uni/widgets/custom_button.dart';
import 'package:parakanm_uni/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String? email;
  String? password;

  void login(BuildContext context) {
    final bool isValidate = formController.currentState!.validate();

    if (!isValidate) {
      return;
    }

    formController.currentState!.save();

    bool isLogin = false;

    for (var user in accounts) {
      if (user["email"] == email!.trim() &&
          user["password"] == password!.trim()) {
        currentUser = user;

        isLogin = true;
      }
    }

    if (!isLogin) {
      addErrorSnackbar(context, "Invalid email or password");

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LayoutScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Start Saving!",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formController,
                          child: Column(
                            children: [
                              CustomTextField(
                                text: "Email",
                                iconPath: emailIcon,
                                onValidate: validateEmail,
                                onSave: (value) {
                                  email = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                text: "Password",
                                iconPath: passwordIcon,
                                onValidate: validatePassword,
                                onSave: (value) {
                                  password = value;
                                },
                                isObsecureText: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                text: "Login",
                                onTap: () {
                                  login(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RegisterScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: primaryColor100,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
