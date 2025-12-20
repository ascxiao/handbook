import 'package:flutter/material.dart';

import '../../data/notifiers.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
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
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
