import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class StepCountForm extends StatefulWidget {
  const StepCountForm({super.key});

  @override
  State<StepCountForm> createState() => _StepCountFormState();
}

class _StepCountFormState extends State<StepCountForm> {
  final FormControl<double> pressureInTheSleeveController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> pressureInStepController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> consumptionController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> resistanceController = FormControl(
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
            text: 'Напор на входе в магистральную рукавную линию',
            controller: pressureInTheSleeveController,
            unit: 'м',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Напор на входе в ступень перекачки',
            controller: pressureInStepController,
            unit: 'м',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Расход воды в напорной рукавной линии',
            controller: consumptionController,
            unit: 'л/с',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Сопротивление одного подарного рукава',
            controller: resistanceController,
            unit: '(м * с^2) / л^2',
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
    final double result = (pressureInTheSleeveController.value! -
            pressureInStepController.value!) /
        (resistanceController.value! * consumptionController.value!);

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
