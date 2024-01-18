import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FoamFromGeneratorForm extends StatefulWidget {
  const FoamFromGeneratorForm({super.key});

  @override
  State<FoamFromGeneratorForm> createState() => _FoamFromGeneratorFormState();
}

class _FoamFromGeneratorFormState extends State<FoamFromGeneratorForm> {
  final FormControl<double> countController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> consumptionController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> timeController = FormControl(
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
            text: 'Количество поданных ГПС',
            controller: countController,
            unit: 'шт.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Расход ГПС по пене',
            controller: consumptionController,
            unit: 'куб.м./мин.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Время работы ГПС',
            controller: timeController,
            unit: 'мин.',
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
                          '$calcResult куб. м',
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
    final double result = (countController.value! * consumptionController.value! * timeController.value!) / 3;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
