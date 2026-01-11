import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/SpacedBy.dart';
import 'topic_card.dart';

class RelatedArticles extends StatelessWidget {
  const RelatedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopicCard(
          id: 1,
          icon: Icons.school_outlined,
          title: 'Graduation Policy',
          preview: '',
          tags: ['Academics', 'Policies'],
        ),
        TopicCard(
          id: 1,
          icon: Icons.school_outlined,
          title: 'Graduation Policy',
          preview: '',
          tags: ['Academics', 'Policies'],
        ),
      ].spacedBy(4.h),
    );
  }
}
