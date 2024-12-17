import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/assets.dart';
import 'package:parakanm_uni/utils/colors.dart';
import 'package:parakanm_uni/utils/data.dart';
import 'package:parakanm_uni/utils/helpers.dart';
import 'package:parakanm_uni/utils/validators.dart';
import 'package:parakanm_uni/widgets/category_card.dart';
import 'package:parakanm_uni/widgets/custom_button.dart';
import 'package:parakanm_uni/widgets/custom_text_field.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void _showCategoryDialog({int? id}) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? name = id != null
        ? categories.firstWhere((category) => category['id'] == id)['name']
        : null;
    String buttonText = id == null ? 'Add Category' : 'Update Category';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  text: name ?? 'Category name',
                  onValidate: validateEmpty,
                  onSave: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 10),
                CustomButton(
                  text: buttonText,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      if (id == null) {
                        setState(() {
                          categories.add({
                            'id': categories.length + 1,
                            'name': name,
                            'icon': othersIcon,
                          });
                        });

                        addSnackbar(context, "Category added successfully");
                      } else {
                        setState(() {
                          categories.firstWhere(
                                  (category) => category['id'] == id)['name'] =
                              name;
                        });

                        addSnackbar(context, "Category updated successfully");
                      }

                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void editCategory(int id) {
    _showCategoryDialog(id: id);
  }

  void deleteCategory(int index) {
    List<Map<String, dynamic>> userTransactions = getCurrentUserTransactions();

    for (int i = 0; i < userTransactions.length; i++) {
      if (userTransactions[i]['categoryId'] == index) {
        addErrorSnackbar(context, "Category is in use");
        return;
      }
    }

    setState(() {
      categories.removeWhere((element) => element['id'] == index);
    });

    addSnackbar(context, "Category deleted successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: primaryColor100,
        title: Text(
          "PARAKANM",
          style: TextStyle(
            color: primaryColor100,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                "Categories",
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 10),
            categories.isEmpty
                ? Center(
                    child: Text(
                      "No categories yet",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          category: categories[index],
                          onEdit: editCategory,
                          onDelete: deleteCategory,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCategoryDialog(),
        backgroundColor: primaryColor100,
        child: const Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
    );
  }
}
