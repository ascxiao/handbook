import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SegmentDivider extends StatelessWidget {
  final String segment;
  const SegmentDivider({super.key, required this.segment});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(color: Theme.of(context).colorScheme.primary, thickness: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              color: Theme.of(context).colorScheme.surface,
              child: Text(
                segment,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
