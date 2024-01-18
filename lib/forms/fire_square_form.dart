import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FireSquareForm extends StatefulWidget {
  const FireSquareForm({super.key});

  @override
  State<FireSquareForm> createState() => _FireSquareFormState();
}

class _FireSquareFormState extends State<FireSquareForm> {
  final FormControl<double> radiusController = FormControl(
    validators: [Validators.required],
  );

  double? calcResult;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculateBloc, CalculateState>(
      listener: (context, state) {
        state.mapOrNull(
          calculated: (_) {
            _calculate();
          },
        );
      },
      child: Column(
        children: [
          TextWithInputWidget(
            text: 'Радиус площади пожара на определенный момент времени',
            controller: radiusController,
            unit: 'м.',
          ),
          const SizedBox(height: 32),
          if (calcResult != null) ...[
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red.withOpacity(0.6),
                      child: Center(
                        child: Text(
                          '$calcResult кв.м',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _calculate() {
    final double result =
        pow(radiusController.value!, 2) * pi;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
