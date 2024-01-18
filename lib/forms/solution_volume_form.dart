import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SolutionVolumeForm extends StatefulWidget {
  const SolutionVolumeForm({super.key});

  @override
  State<SolutionVolumeForm> createState() => _SolutionVolumeFormState();
}

class _SolutionVolumeFormState extends State<SolutionVolumeForm> {
  final FormControl<double> volumeController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> ratioController = FormControl(
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
            text: 'Объем пенообразователя',
            controller: volumeController,
            unit: 'л',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Отношение концентрации воды к концентрации пенообразователя',
            controller: ratioController,
            unit: '',
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
                          '$calcResult л.',
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
    final double result = volumeController.value! * ratioController.value! +
        volumeController.value!;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
