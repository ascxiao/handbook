import 'dart:convert';
import 'package:flutter/services.dart';

class Article {
  final String title;
  final String content;
  final List<String> tags;
  final String date;

  Article({
    required this.title,
    required this.content,
    required this.tags,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      content: json['content'],
      tags: List<String>.from(json['tags'] ?? []),
      date: json['date'],
    );
  }
}

class ArticleService {
  static Future<List<Article>> loadArticles() async {
    String jsonString = await rootBundle.loadString(
      'assets/articles/articles.json',
    );
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Article.fromJson(json)).toList();
  }

  static Future<Article?> getArticleByID(int id) async {
    String jsonString = await rootBundle.loadString(
      'assets/articles/articles.json',
    );
    List<dynamic> jsonList = json.decode(jsonString);

    try {
      var articleJson = jsonList.firstWhere((json) => json['id'] == id);
      return Article.fromJson(articleJson);
    } catch (e) {
      return null;
    }
  }
}
