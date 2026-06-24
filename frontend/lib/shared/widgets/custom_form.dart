import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String? hint;
  final String tag;
  final IconButton? icon;
  final Widget? prefixIcon;
  final int? line;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomForm({
    this.hint,
    required this.tag,
    this.icon,
    this.prefixIcon,
    this.line,
    required this.controller,
    this.validator,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tag.toUpperCase(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 5,),
        Card(
          child: TextFormField(
            controller: controller,
            readOnly: icon != null,
            keyboardType: TextInputType.multiline,
            maxLines: line,
            validator: validator,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: Color(0xFF777681)
              ),
              contentPadding: EdgeInsets.all(13),
              suffixIcon: icon,
              prefixIcon: prefixIcon
            ),
          ),
        ),
      ],
    );
  }
}