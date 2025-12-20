import 'package:flutter/material.dart';
import 'package:handbook/data/notifiers.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: darkModeNotifier,
              builder: (context, isDark, child) {
                return IconButton(
                  onPressed: () {
                    darkModeNotifier.value = !darkModeNotifier.value;
                  },
                  icon: isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
