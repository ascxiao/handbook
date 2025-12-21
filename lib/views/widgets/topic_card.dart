import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handbook/views/pages/article_page.dart';
import 'package:handbook/views/widgets/topic_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/SpacedBy.dart';

class TopicCard extends StatefulWidget {
  final int id;
  final String title;
  final String preview;
  final IconData icon;
  final List<String> tags;

  const TopicCard({
    super.key,
    required this.title,
    required this.preview,
    required this.tags,
    required this.icon,
    required this.id,
  });

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.green.withAlpha(30),
        onTap: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ArticlePage(id: widget.id);
                },
              ),
            );
          });
          ;
        },
        child: Ink(
          width: 342.w,
          padding: EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Icon(
                      widget.icon,
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Wrap(
                    children: [
                      Text(
                        widget.title,
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
                  widget.preview != ''
                      ? SizedBox(
                          height: 54.h,
                          width: 295.w,
                          child: Text(
                            widget.preview,
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              Gap(8.h),
              Row(
                children: [
                  for (String tag in widget.tags) Topic(topicName: tag),
                ].spacedBy(8.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
