import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:march_cycle_predictor/features/feature_period/presentation/bloc/period_bloc.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/widgets/chosen_date.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/widgets/result_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PeriodScreen extends StatefulWidget {
  const PeriodScreen({super.key});

  @override
  State<PeriodScreen> createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PeriodBloc>(context);
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('March Cycle Predictor',
              style: textTheme.headlineLarge!.copyWith(color: Colors.white)),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: BlocConsumer<PeriodBloc, PeriodState>(
            listener: (BuildContext context, PeriodState state) {
              if (state is OutOfRangeLengthState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Average cycle length is usually between 21 and 35 days.'),
                  duration: Duration(seconds: 2),
                ));
              }
              if (state is CalculationDoneState) {
                showDialog(
                    context: context,
                    builder: (context) => ResultDialog(
                          isWarning: state.isWarning,
                          result: state.result,
                        ));
              }
            },
            buildWhen: (previous, current) =>
                current is InputChangedState || current is PeriodInitial || current is OutOfRangeLengthState,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1) Enter your average cycle length:',
                      style: textTheme.bodyMedium,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      width: 20.w,
                      child: TextField(
                        onChanged: (value) => bloc.add(TextFieldChangedEvent(value: value)),
                        style: textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                        controller: _controller,
                        keyboardType: const TextInputType.numberWithOptions(),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                            hintText: 'e.g. 28'),
                        maxLength: 2,
                      ),
                    ),
                    Text(
                      '2) Choose your last three cycles start dates:',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => pickDate(bloc),
                      child: const Text('Pick a date'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 25.h,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state is PeriodInitial
                            ? 0
                            : bloc.chosenDates.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: ChosenDate(
                              index: index,
                              date: DateFormat.yMMMMd().format(
                                bloc.chosenDates[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: bloc.chosenDates.length == 3 && bloc.averageInputLength==2
                            ? () => bloc.add(CalculateCyclesEvent(
                                averageCycle: int.parse(_controller.text)))
                            : null,
                        child: const Text('Calculate Next Cycles'))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  pickDate(PeriodBloc bloc) async {
    if (bloc.chosenDates.length > 2) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please choose 3 dates only'),
        duration: Duration(seconds: 1),
      ));
    } else {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 100)),
        lastDate: DateTime.now(),
      );
      if (date == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please pick a date'),
            duration: Duration(seconds: 1),
          ));
        }
      } else {
        if (mounted) {
          bloc.add(AddDateEvent(date: date));
        }
      }
    }
  }
}
