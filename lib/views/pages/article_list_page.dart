import 'package:flutter/material.dart';
import 'package:handbook/views/widgets/topic_card.dart';
import '../../data/article_service.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List<Article> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    articles = await ArticleService.loadArticles();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

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
