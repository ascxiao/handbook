import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:handbook/extensions/SpacedBy.dart';
import 'package:handbook/views/widgets/segment_divider.dart';
import 'package:handbook/views/widgets/topic_chip.dart';

import '../../data/article_service.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/navbar.dart';
import '../widgets/page_control_widget.dart';
import '../widgets/related_articles_widget.dart';

class ArticlePage extends StatefulWidget {
  final int id;
  const ArticlePage({super.key, required this.id});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Article? article;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    article = await ArticleService.getArticleByID(widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return Scaffold(body: Center(child: Text('Article not found')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          article!.title,
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: 'Gilgan',
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        actions: [
          SearchAnchor(
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
        ],
      ),
      bottomNavigationBar: NavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 32.w),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    article!.title,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  for (String tag in article!.tags) Topic(topicName: tag),
                ].spacedBy(4.h),
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16.r, color: Colors.grey[500]),
                  Text(
                    'Updated as of ${article!.date}',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ].spacedBy(4.h),
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 2,
              ),
              Gap(10.h),
              Wrap(
                children: [
                  MarkdownBody(
                    data: article!.content,
                    selectable: true,
                    styleSheet: MarkdownStyleSheet(
                      textAlign: WrapAlignment.start,
                      h1: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontWeight: FontWeight.bold,
                      ),
                      h2: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontWeight: FontWeight.w400,
                      ),
                      blockquoteDecoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHigh,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(32.h),
              SegmentDivider(segment: 'Related Articles'),
              Gap(16.h),
              RelatedArticles(),
              Gap(16.h),
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 2,
              ),
              Gap(32.h),
              PageControl(),
            ],
          ),
        ),
      ),
    );
  }
}
