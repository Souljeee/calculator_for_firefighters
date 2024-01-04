import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FreeFireDevelopmentTimeForm extends StatefulWidget {
  const FreeFireDevelopmentTimeForm({super.key});

  @override
  State<FreeFireDevelopmentTimeForm> createState() =>
      _FreeFireDevelopmentTimeFormState();
}

class _FreeFireDevelopmentTimeFormState
    extends State<FreeFireDevelopmentTimeForm> {
  final FormControl<double> fireStartsTimeController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> departmentGoingTimeController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> followUpTimeController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> deploymentTimeController = FormControl(
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
            text:
                'Время от момента возникновения пожара до сообщения о нем в ПО',
            controller: fireStartsTimeController,
            unit: 'мин.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Время сбора отделеня с выездом за ворота депо',
            controller: departmentGoingTimeController,
            unit: 'мин.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text:
                'Время следования первого пожарного подразделения к месту пожара',
            controller: followUpTimeController,
            unit: 'мин.',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Время боевого развертывания пожарного расчета с подачей ОВ',
            controller: deploymentTimeController,
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
                          '$calcResult',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _calculate() {
    final double result = fireStartsTimeController.value! +
        departmentGoingTimeController.value! +
        followUpTimeController.value! +
        deploymentTimeController.value!;

    setState(() {
      calcResult = result;
    });
  }
}
