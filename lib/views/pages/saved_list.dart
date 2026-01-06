import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handbook/views/widgets/topic_card.dart';
import '../../data/article_service.dart';

class SavedList extends StatefulWidget {
  @override
  _SavedListState createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  List<Article> articles = [];
  List<Article> savedArticles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    articles = await ArticleService.loadSavedArticles();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (articles.isEmpty) {
      return Center(
        child: Text(
          'Your saved articles will be listed here.',
          style: TextStyle(fontSize: 12.sp),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return TopicCard(
            id: articles[index].id,
            icon: Icons.school_outlined,
            title: articles[index].title,
            preview: '',
            tags: articles[index].tags,
          );
        },
      );
    }
  }
}
