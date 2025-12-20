import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handbook/data/notifiers.dart';
import 'package:handbook/views/widgets/search_bar.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.schoolLogo,
  });

  final String? title;
  final String? schoolLogo;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return AppBar(
          title: selectedPage == 0
              ? Text(
                  title!,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: 'Gilgan',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                )
              : SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return IconButton(
                      onPressed: () {
                        controller.openView();
                      },
                      icon: Icon(Icons.search),
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(title: Text(item), onTap: () {});
                        });
                      },
                ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Row(
                children: [Image.asset(schoolLogo!, height: 75.h, width: 75.w)],
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: false,
          backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        );
      },
    );
  }
}
