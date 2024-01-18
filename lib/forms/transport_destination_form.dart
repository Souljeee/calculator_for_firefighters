import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TransportDestinationForm extends StatefulWidget {
  const TransportDestinationForm({super.key});

  @override
  State<TransportDestinationForm> createState() =>
      _TransportDestinationFormState();
}

class _TransportDestinationFormState extends State<TransportDestinationForm> {
  final FormControl<double> pumpPressureController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> trunkHeightController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> requiredPressureController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> heightSleeveController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> pressureInTheSleeveController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> waterSupplyController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> sleeveSizeController = FormControl(
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
            text: 'Напор на насосе МСП',
            controller: pumpPressureController,
            unit: 'м',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Высота подъема (спуска) ствола',
            controller: trunkHeightController,
            unit: 'м',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text:
                'Требуемый напор на приборе подачи огнетушащих веществ (стволе)',
            controller: requiredPressureController,
            unit: 'м',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Высота подъема (спуска) рукавной линии на местности',
            controller: heightSleeveController,
            unit: 'м',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Сопротивление одного напорного пожарного рукава',
            controller: pressureInTheSleeveController,
            unit: '(м * с^2) / л^2',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Подача воды по магистральной рукавой линии',
            controller: waterSupplyController,
            unit: 'л/с',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Средняя длина одного напорного пожарного рукава',
            controller: sleeveSizeController,
            unit: 'м',
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
                          '$calcResult м.',
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
    final double result = (sleeveSizeController.value! *
            (pumpPressureController.value! -
                (requiredPressureController.value! +
                    trunkHeightController.value! +
                    heightSleeveController.value!))) /
        pressureInTheSleeveController.value! *
        pow(waterSupplyController.value!, 2);

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
