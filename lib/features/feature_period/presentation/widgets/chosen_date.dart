import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/bloc/period_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//Each selected date from date picker will result in creation of an instance of this widget
class ChosenDate extends StatelessWidget {
  final int index;
  final String date;
  const ChosenDate({required this.index, required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 60.w,
      child: Card(
        margin: const EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //User can delete the selected date's card and choose again
              IconButton(
                  onPressed: () => BlocProvider.of<PeriodBloc>(context).add(
                        DeleteDateEvent(index: index),
                      ),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              Text(date),
            ],
          ),
        ),
      ),
    );
  }
}
