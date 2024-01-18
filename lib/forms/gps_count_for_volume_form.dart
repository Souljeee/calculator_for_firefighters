import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GpsCountForVolumeForm extends StatefulWidget {
  const GpsCountForVolumeForm({super.key});

  @override
  State<GpsCountForVolumeForm> createState() => _GpsCountForVolumeFormState();
}

class _GpsCountForVolumeFormState extends State<GpsCountForVolumeForm> {
  final FormControl<double> volumeController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> timeController = FormControl(
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
            text: 'Объем помещения',
            controller: volumeController,
            unit: 'куб.м.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Расход пены из ГПС',
            controller: consumptionController,
            unit: 'куб.м./мин',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Расчетное время подачи пены',
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
    final double result = (volumeController.value! * 3) /
        (consumptionController.value! * timeController.value!);

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
