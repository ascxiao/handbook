import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../extensions/SpacedBy.dart';

class PageControl extends StatelessWidget {
  const PageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.chevron_left),
            Text('Graduation Policy'),
            Icon(Icons.chevron_right),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 120, child: Text('Academic Performance')),
            SizedBox(
              width: 120,
              child: Text(
                'School Sponsored Activities',
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ].spacedBy(16.h),
    );
  }
}
