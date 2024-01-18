import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platon_calc/forms/calculate_bloc/calculate_bloc.dart';
import 'package:platon_calc/text_with_input_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FollowingTimeForm extends StatefulWidget {
  const FollowingTimeForm({super.key});

  @override
  State<FollowingTimeForm> createState() => _FollowingTimeFormState();
}

class _FollowingTimeFormState extends State<FollowingTimeForm> {
  final FormControl<double> followingDestinationController = FormControl(
    validators: [Validators.required],
  );
  final FormControl<double> speedController = FormControl(
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
            text: 'Расстояние следования до места пожара',
            controller: followingDestinationController,
            unit: 'км',
          ),
          const SizedBox(height: 32),
          TextWithInputWidget(
            text: 'Средняя скорость следования МСП',
            controller: speedController,
            unit: 'км/ч',
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
                          '$calcResult мин.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w800),
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
    final double result =
        (60 * followingDestinationController.value!) / speedController.value!;

    setState(() {
      calcResult = double.parse(result.toStringAsFixed(2));
    });
  }
}
