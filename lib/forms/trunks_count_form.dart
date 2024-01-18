import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TrunksCountForm extends StatefulWidget {
  const TrunksCountForm({super.key});

  @override
  State<TrunksCountForm> createState() => _TrunksCountFormState();
}

class _TrunksCountFormState extends State<TrunksCountForm> {
  final FormControl<double> requiredConsumptionController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> consumptionFromTechController = FormControl(
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
            text: 'Требуемый расход огнетушащего вещества',
            controller: requiredConsumptionController,
            unit: 'л/c, кг/с',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text:
                'Расход огнетушащего вещества из технического средства подачи',
            controller: consumptionFromTechController,
            unit: 'л/c, кг/с',
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
                          '$calcResult шт.',
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
    final double result = requiredConsumptionController.value! /
        consumptionFromTechController.value!;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
