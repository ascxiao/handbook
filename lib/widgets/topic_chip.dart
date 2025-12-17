import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Topic extends StatelessWidget {
  final String topicName;

  const Topic({super.key, required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        topicName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Gilgan',
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
      side: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 2,
      ),
      padding: EdgeInsets.all(2.r),
    );
  }
}
