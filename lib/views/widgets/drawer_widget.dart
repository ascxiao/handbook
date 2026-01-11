import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handbook/data/notifiers.dart';
import 'package:handbook/views/pages/directory_list.dart';
import 'package:handbook/views/pages/faq_list.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        surfaceTintColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/usls.png', height: 50),
                  Text(
                    'The Official Mobile Handbook of USLS',
                    style: TextStyle(
                      fontFamily: 'Gilgan',
                      fontSize: 12.sp,
                      color: Colors.white,
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
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DirectoryList();
                      },
                    ),
                  );
                });
              },
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
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FaqList();
                      },
                    ),
                  );
                });
              },
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
