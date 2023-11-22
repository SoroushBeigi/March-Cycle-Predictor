import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      title: Text(
        isWarning ? 'Warning!' : 'Result',
        style: textTheme.bodyLarge!
            .copyWith(color: isWarning ? Colors.orange[700] : Colors.teal[700]),
      ),
      content: Container(
        padding: EdgeInsets.only(bottom: 2.h),
        width: 75.w,
        child: Text(
          result,
          style: textTheme.bodyMedium,
        ),
      ),
    );
  }
}
