import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handbook/widgets/topic_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/SpacedBy.dart';

class TopicCard extends StatelessWidget {
  final String title;
  final String preview;
  //! ADD SOMETHING FOR THE TAGS/CHIPS

  const TopicCard({super.key, required this.title, required this.preview});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.green.withAlpha(30),
        onTap: () {
          print('Card tapped.');
        },
        child: Ink(
          width: 342.w,
          height: 188.h,
          padding: EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Icon(
                      Icons.school_outlined,
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Wrap(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 20.sp,
                          height: 1.62.h,
                          fontVariations: const [FontVariation('wght', 900)],
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Wrap(
                children: [
                  SizedBox(
                    height: 54.h,
                    width: 295.w,
                    child: Text(
                      preview,
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.secondary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(24.h),
              Row(
                children: [
                  Topic(topicName: 'Academics'),
                  Topic(topicName: 'Academics'),
                ].spacedBy(8.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
