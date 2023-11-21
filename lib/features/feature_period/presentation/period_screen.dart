import 'package:flutter/material.dart';

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
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // showDatePicker(
                  //     context: context,
                  //     initialDate: DateTime.now(),
                  //     firstDate:
                  //         DateTime.now().subtract(const Duration(days: 150)),
                  //     lastDate: DateTime.now().add(const Duration(days: 150)));
                },
                child: const Text('Pick a date')),
          ],
        ),
      ),
    );
  }
}
