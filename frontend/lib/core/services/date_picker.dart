import 'package:flutter/material.dart';

Future<DateTime?> datePicker(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context, 
    initialDate: DateTime.now(),
    firstDate: DateTime(2000), 
    lastDate: DateTime(2030)
  );

  return pickedDate;
}