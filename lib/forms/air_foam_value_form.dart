import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AirFoamVolumeForm extends StatefulWidget {
  const AirFoamVolumeForm({super.key});

  @override
  State<AirFoamVolumeForm> createState() => _AirFoamVolumeFormState();
}

class _AirFoamVolumeFormState extends State<AirFoamVolumeForm> {
  final FormControl<double> volumeController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> multiplicityController = FormControl(
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
            text: 'Объем раствора пенообразователя в воде',
            controller: volumeController,
            unit: 'л',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Кратность пены',
            controller: multiplicityController,
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
    final double result = volumeController.value! * multiplicityController.value!;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
