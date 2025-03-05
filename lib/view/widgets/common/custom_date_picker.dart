import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CDatePicker extends StatefulWidget {
  final Function(String?)? onSavedCallback;

  const CDatePicker({super.key, this.onSavedCallback});

  @override
  State<CDatePicker> createState() => _CDatePickerState();
}

class _CDatePickerState extends State<CDatePicker> {
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1975),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: "Select Date",
        suffixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(),
      ),
      onTap: () => _selectDate(context),
      onSaved: widget.onSavedCallback,
    );
  }
}
