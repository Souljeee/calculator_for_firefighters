import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RequiredConsumptionForm extends StatefulWidget {
  const RequiredConsumptionForm({super.key});

  @override
  State<RequiredConsumptionForm> createState() =>
      _RequiredConsumptionFormState();
}

class _RequiredConsumptionFormState extends State<RequiredConsumptionForm> {
  final FormControl<double> squareController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> intensitController = FormControl(
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
            text: 'Расчетная площадь тушения',
            controller: squareController,
            unit: 'кв.м.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Требуемая интенсивность подачи огнетушащего вещества',
            controller: intensitController,
            unit: 'л/(кв.м. * с), кг/(кв.м. * с)',
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
                          '$calcResult л/с, кг/с',
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
    final double result = squareController.value! * intensitController.value!;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
