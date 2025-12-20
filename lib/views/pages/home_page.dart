import 'package:flutter/material.dart';
import '/extensions/SpacedBy.dart';
import '../widgets/category_card.dart';
import '../widgets/category_list.dart';
import '../widgets/segment_divider.dart';
import '../widgets/title_card.dart';
import '../widgets/topic_card.dart';
import 'package:handbook/views/widgets/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 32.w),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchBarWidget(
                  width: 263.w,
                  height: 58.h,
                  fontSize: 16,
                  iconSize: 32,
                ),
                IconButton(
                  icon: Icon(Icons.info, color: Colors.grey),
                  iconSize: 32.r,
                  onPressed: () {},
                ),
              ],
            ),
            TitleCard(
              title: 'Welcome to University of St. La Salle',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            SegmentDivider(segment: 'Quick Access'),
            TopicCard(
              title: 'Graduation Policy',
              preview:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryCard(category: 'Academic Policies and Procedures'),
                    CategoryCard(category: 'Student Affairs'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryCard(category: 'Student Programs'),
                    CategoryCard(category: 'Student Discipline and Formation'),
                  ],
                ),
              ],
            ),
            SegmentDivider(segment: 'Browse by Category'),
            ListBody(
              mainAxis: Axis.vertical,
              children: [
                CategoryListTile(title: 'Institutional Profile'),
                CategoryListTile(title: 'College Council & Committees'),
                CategoryListTile(title: 'Support Services'),
                CategoryListTile(title: 'Academic Programs'),
                CategoryListTile(title: 'Academic Policies & Procedures'),
                CategoryListTile(title: 'Student Affairs'),
                CategoryListTile(title: 'Student Programs'),
                CategoryListTile(title: 'Student Discipline & Formation'),
                CategoryListTile(title: 'Campus Clubs and Organizations'),
                CategoryListTile(title: 'University Student Government'),
                CategoryListTile(title: 'Security & Safety Guidelines'),
                CategoryListTile(title: 'Appendices'),
              ].spacedBy(10.h),
            ),
          ].spacedBy(25.h),
        ),
      ),
    );
  }
}
