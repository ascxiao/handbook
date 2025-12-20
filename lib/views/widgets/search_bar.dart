import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  final double fontSize;

  const SearchBarWidget({
    super.key,
    required this.width,
    required this.height,
    required this.iconSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SizedBox(
          height: height.h,
          width: width.w,
          child: SearchBar(
            hintText: 'Any questions?',
            hintStyle: WidgetStateProperty.all(
              TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontFamily: 'IBM Plex Sans',
                fontSize: fontSize.sp,
              ),
            ),
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.surface,
            ),
            side: WidgetStateProperty.all(
              BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
                width: 1.5,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            controller: controller,
            padding: WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (value) {
              controller.openView();
            },
            trailing: <Widget>[Icon(Icons.search, size: iconSize.r)],
          ),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(title: Text(item), onTap: () {});
        });
      },
    );
  }
}
