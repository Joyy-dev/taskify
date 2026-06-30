import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String? hint;
  final String tag;
  final String? actionText;
  final VoidCallback? tagButton;
  final IconButton? icon;
  final Widget? prefixIcon;
  final int? line;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;

  const CustomForm({
    this.hint,
    required this.tag,
    this.icon,
    this.actionText,
    this.tagButton,
    this.prefixIcon,
    this.line,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tag.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (actionText != null)
            TextButton(
              onPressed: tagButton, 
              child: Text(
                actionText!
              )
            )
          ],
        ),
        const SizedBox(height: 5,),
        Card(
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            obscureText: obscureText,
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