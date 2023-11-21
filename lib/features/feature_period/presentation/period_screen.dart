import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:march_cycle_predictor/features/feature_period/presentation/bloc/period_bloc.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/widgets/chosen_date.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PeriodScreen extends StatefulWidget {
  const PeriodScreen({super.key});

  @override
  State<PeriodScreen> createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'March Cycle Predictor',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: pickDate,
                child: const Text('Pick a date'),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<PeriodBloc, PeriodState>(
                buildWhen: (previous, current) =>
                    current is ChosenDatesChangedState,
                builder: (context, state) {
                  return SizedBox(
                    height: 25.h,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state is ChosenDatesChangedState
                          ? state.dates.length
                          : 0,
                      itemBuilder: (context, index) {
                        return Center(
                          child: ChosenDate(
                            index: index,
                            date: DateFormat.yMMMMd().format(
                              (state as ChosenDatesChangedState).dates[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  pickDate() async {

    if (BlocProvider.of<PeriodBloc>(context).chosenDates.length > 2) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please choose 3 dates only'),
        duration: Duration(seconds: 1),
      ));
    } else {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 150)),
        lastDate: DateTime.now().add(const Duration(days: 150)),
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
          BlocProvider.of<PeriodBloc>(context).add(AddDateEvent(date: date));
        }
      }
    }
  }
}
