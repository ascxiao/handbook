import 'package:flutter/material.dart';
import 'package:handbook/data/notifiers.dart';
import 'package:handbook/views/pages/article_page.dart';
import 'package:handbook/views/pages/home_page.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/drawer_widget.dart';
import 'widgets/navbar.dart';

List<Widget> pages = [HomePage(), ArticlePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  final String? title = 'Handbook';
  final String? schoolLogo = 'assets/images/usls.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: title!, schoolLogo: schoolLogo!),
      bottomNavigationBar: NavBar(),
      drawer: DrawerWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
    );
  }
}
