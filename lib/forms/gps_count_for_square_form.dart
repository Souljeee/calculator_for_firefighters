import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GPSCountForSquareForm extends StatefulWidget {
  const GPSCountForSquareForm({super.key});

  @override
  State<GPSCountForSquareForm> createState() => _GPSCountForSquareFormState();
}

class _GPSCountForSquareFormState extends State<GPSCountForSquareForm> {
  final FormControl<double> squareController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> intenseController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> consumptionController = FormControl(
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
            text: 'Площадь горения',
            controller: squareController,
            unit: 'кв.м.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text:
                'Требуемая интенсивность подачи раствора пенообразователя в воде',
            controller: intenseController,
            unit: 'л/(кв.м. * с), кг/(кв.м. * с)',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Расход раствора из одного ГПС',
            controller: consumptionController,
            unit: 'л/c',
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
    final double result = (squareController.value! * intenseController.value!) /
        consumptionController.value!;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
