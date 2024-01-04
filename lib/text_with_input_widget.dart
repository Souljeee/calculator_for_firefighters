import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TextWithInputWidget extends StatelessWidget {
  final String text;
  final FormControl controller;
  final String unit;

  const TextWithInputWidget({
    required this.text,
    required this.controller,
    required this.unit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 50,
          child: ReactiveTextField(
            formControl: controller,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        const SizedBox(width: 16),
        Text(
          unit,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
