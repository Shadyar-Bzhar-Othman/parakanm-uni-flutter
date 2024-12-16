import 'package:flutter/material.dart';
import 'package:parakanm_uni/screens/login_screen.dart';
import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/validators.dart';
import 'package:parakanm_uni/widgets/custom_button.dart';
import 'package:parakanm_uni/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String? name;
  String? email;
  String? password;

  void register(BuildContext context) {
    final bool isValidate = formController.currentState!.validate();

    if (!isValidate) {
      return;
    }

    formController.currentState!.save();

    accounts.add({
      'id': accounts.length + 1,
      'name': name!,
      'email': email!,
      'password': password!,
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
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
                      "Create a Free Account",
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
                            text: "Name",
                            iconPath: nameIcon,
                            onValidate: validateName,
                            onSave: (value) {
                              name = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                            text: "Register",
                            onTap: () {
                              register(context);
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
                          "Already have an account?",
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
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Login",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
