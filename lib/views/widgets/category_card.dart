import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primary.withAlpha(30),
        onTap: () {},
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 69.h),
          child: Ink(
            width: 150.w,
            padding: EdgeInsets.all(8.r),
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: 85.w,
                      child: Text(
                        category,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Theme.of(context).colorScheme.primary,
                          height: 1.08.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
