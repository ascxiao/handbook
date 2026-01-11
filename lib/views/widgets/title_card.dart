import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final String content;

  const TitleCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.green.withAlpha(30),
        onTap: () {
          print('Card tapped.');
        },
        child: Ink(
          width: 342.w,
          height: 113.h,
          padding: EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          child: Column(
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 16.sp,
                  height: 1.62.h,
                  fontVariations: const [FontVariation('wght', 900)],
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Wrap(
                children: [
                  SizedBox(
                    height: 48.h,
                    width: 295.w,
                    child: Text(
                      content,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.secondary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
