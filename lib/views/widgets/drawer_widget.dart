import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handbook/data/notifiers.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        surfaceTintColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/usls.png', height: 50),
                  Text(
                    'The Official Mobile Handbook of USLS ems',
                    style: TextStyle(
                      fontFamily: 'Gilgan',
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Official Directory',
                style: TextStyle(fontFamily: 'IBM Plex Sans'),
              ),
              leading: Icon(Icons.phone),
            ),
            ListTile(
              title: Text(
                'Office of Student Affairs',
                style: TextStyle(fontFamily: 'IBM Plex Sans'),
              ),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text(
                'FAQs',
                style: TextStyle(fontFamily: 'IBM Plex Sans'),
              ),
              leading: Icon(Icons.question_mark),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ValueListenableBuilder(
                valueListenable: darkModeNotifier,
                builder: (context, isDark, child) {
                  return ToggleButtons(
                    isSelected: [isDark],
                    onPressed: (int index) {
                      darkModeNotifier.value = !darkModeNotifier.value;
                    },
                    children: [
                      isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
