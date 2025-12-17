import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListTile extends StatelessWidget {
  final String title;
  //!ADD FUNCTIONALITY WHICH PAGE TO GO OR WHATEVS

  const CategoryListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5.r, spreadRadius: 1.r),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Gilgan',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).colorScheme.primary,
        ),
        onTap: () {
          print('I did this!!');
        },
      ),
    );
  }
}
