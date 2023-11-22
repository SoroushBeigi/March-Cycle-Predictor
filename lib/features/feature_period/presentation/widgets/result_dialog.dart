import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//We show the result (3 future cycle start dates and warnings, if there is any) in this widget.
class ResultDialog extends StatelessWidget {
  final bool isWarning;
  final String result;

  const ResultDialog({
    required this.isWarning,
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
      title: Text(
        isWarning ? 'Warning!' : 'Result',
        style: textTheme.bodyLarge!
            .copyWith(color: isWarning ? Colors.orange[700] : Colors.teal[700]),
      ),
      content: Container(
        padding: EdgeInsets.zero,
        width: 75.w,
        child: Text(
          result,
          style: textTheme.bodyMedium,
        ),
      ),
    );
  }
}
