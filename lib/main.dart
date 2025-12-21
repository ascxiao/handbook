import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handbook/data/notifiers.dart';
import 'package:handbook/views/widget_tree.dart';

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
        return ValueListenableBuilder(
          valueListenable: darkModeNotifier,
          builder: (context, isDark, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(
                      seedColor: Color(0xFF006633),
                      brightness: isDark ? Brightness.dark : Brightness.light,
                    ).copyWith(
                      surfaceBright: Colors.white,
                      surfaceDim: const Color.fromARGB(255, 1, 25, 3),
                      primaryFixed: const Color.fromARGB(255, 0, 59, 2),
                    ),
              ),
              home: WidgetTree(),
            );
          },
        );
      },
    );
  }
}
