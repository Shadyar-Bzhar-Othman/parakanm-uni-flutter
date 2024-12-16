import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/helpers.dart';
import 'package:parakanm_uni/utils/types.dart';
import 'package:parakanm_uni/utils/validators.dart';
import 'package:parakanm_uni/widgets/custom_button.dart';
import 'package:parakanm_uni/widgets/custom_date_picker.dart';
import 'package:parakanm_uni/widgets/custom_dropdown.dart';
import 'package:parakanm_uni/widgets/custom_tab_button.dart';
import 'package:parakanm_uni/widgets/custom_text_area.dart';
import 'package:parakanm_uni/widgets/custom_text_field.dart';

class AddScreen extends StatefulWidget {
  AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  int type = 1;

  int? category = 1;

  String? title;

  String? details;

  int? amount;

  String? date;

  void add(BuildContext context) {
    final bool isValidate = formController.currentState!.validate();

    if (!isValidate) {
      return;
    }

    formController.currentState!.save();

    Map<String, dynamic> transaction = {
      'id': accounts.length + 1,
      "userId": currentUser["id"],
      "categoryId": category!,
      "type": type == 1 ? TransactionType.income : TransactionType.expense,
      "title": title!,
      "details": details!,
      "amount": amount!,
      "date": date!,
    };

    transactions.add(transaction);

    setState(() {
      type = 1;
      category = 1;
      title = null;
      details = null;
      amount = null;
      date = null;

      formController.currentState!.reset();
    });

    addSnackbar(context, "Transaction added successfully");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add Transaction",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTabButton(
                            text: "Income",
                            isSelected: type == 1,
                            onTap: () {
                              setState(() {
                                type = 1;
                              });
                            },
                            selectedColor: greenColor100,
                            unselectedColor: greenColor20,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CustomTabButton(
                            text: "Expense",
                            isSelected: type == 2,
                            onTap: () {
                              setState(() {
                                type = 2;
                              });
                            },
                            selectedColor: redColor100,
                            unselectedColor: redColor20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: "Title",
                        onValidate: validateEmpty,
                        onSave: (value) {
                          title = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDropdown(
                        hintText: "Select a category",
                        items: categories.map((category) {
                          return DropdownMenuItem<int>(
                            value: category['id'],
                            child: Text(category['name']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            category = value;
                          });
                        },
                        onSaved: (value) {
                          category = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: "Amount",
                        onValidate: validateEmpty,
                        onSave: (value) {
                          amount = int.parse(value.toString());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDatePicker(
                        onSave: (value) {
                          date = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextArea(
                        text: "Details",
                        onValidate: validateEmpty,
                        onSave: (value) {
                          details = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: "Add Transaction",
                        onTap: () {
                          add(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
