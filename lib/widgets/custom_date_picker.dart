import 'package:flutter/material.dart';
import 'package:parakanm_uni/utils/colors.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    required this.onSave,
  });

  final void Function(String? value) onSave;

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _controller.text.isEmpty
          ? DateTime.now()
          : DateTime.parse(_controller.text),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _controller.text = picked.toString().split(" ")[0];
      });

      widget.onSave(_controller.text = picked.toString().split(" ")[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: greyColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: "Select Date",
        hintStyle: TextStyle(
          color: darkGreyColor,
          fontSize: 14,
        ),
        labelStyle: TextStyle(
          color: blackColor,
          fontSize: 14,
        ),
        prefixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () => _selectDate(context),
      onSaved: widget.onSave,
      readOnly: true,
    );
  }
}
