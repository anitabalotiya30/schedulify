import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? c;
  final String label;
  final bool readOnly;
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.label,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.c,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: c,
      decoration: InputDecoration(label: Text(label)),
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
