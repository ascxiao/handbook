import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handbook/widgets/search_bar.dart';
import 'extensions/SpacedBy.dart';
import 'widgets/category_card.dart';
import 'widgets/category_list.dart';
import 'widgets/segment_divider.dart';
import 'widgets/title_card.dart';
import 'widgets/topic_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF006633),
              brightness: Brightness.light,
            ).copyWith(surface: Colors.white),
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final String? title = 'Handbook';
  final String? schoolLogo = 'assets/images/usls.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: 'Gilgan',
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Image.asset(
              'assets/images/usls.png',
              height: 75.h,
              width: 75.w,
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home, size: 20),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_rounded, size: 48),
            label: 'Open Handbook',
          ),
          NavigationDestination(
            icon: Icon(Icons.star, size: 20),
            label: 'Saved',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      drawer: SafeArea(child: Drawer(surfaceTintColor: Colors.white)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 32.w),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchBarApp(width: 263, height: 58),
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
                      CategoryCard(
                        category: 'Academic Policies and Procedures',
                      ),
                      CategoryCard(category: 'Student Affairs'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryCard(category: 'Student Programs'),
                      CategoryCard(
                        category: 'Student Discipline and Formation',
                      ),
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
      ),
    );
  }
}
