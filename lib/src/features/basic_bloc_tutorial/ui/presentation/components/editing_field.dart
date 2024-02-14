import 'package:flutter/material.dart';

class EditingField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(BuildContext) onSubmitted;

  const EditingField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      onSubmitted: (_) => onSubmitted(context),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.8),
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.15),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.check, size: 28, color: Colors.green),
          onPressed: () => onSubmitted(context),
        ),
      ),
    );
  }
}
