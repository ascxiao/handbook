import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Article {
  final int id;
  final String title;
  final String content;
  final List<String> tags;
  final String date;
  bool saved;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.tags,
    required this.date,
    required this.saved,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      tags: List<String>.from(json['tags'] ?? []),
      date: json['date'],
      saved: json['saved'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': '',
      'chapter_num': '',
      'title': title,
      'date': date,
      'tags': tags,
      'saved': saved,
      'content': content,
    };
  }
}

class ArticleService {
  static Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/articles.json');
  }

  static Future<String> _getArticlesJson() async {
    try {
      final file = await _getLocalFile();

      // If local file doesn't exist, copy from assets
      if (!await file.exists()) {
        String jsonString = await rootBundle.loadString(
          'assets/articles/articles.json',
        );
        await file.writeAsString(jsonString);
        return jsonString;
      }

      // Read from local file
      return await file.readAsString();
    } catch (e) {
      // Fallback to assets if there's an error
      return await rootBundle.loadString('assets/articles/articles.json');
    }
  }

  static Future<List<Article>> loadArticles() async {
    String jsonString = await _getArticlesJson();
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Article.fromJson(json)).toList();
  }

  static Future<List<Article>> loadSavedArticles() async {
    String jsonString = await _getArticlesJson();
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList
        .map((json) => Article.fromJson(json))
        .where((article) => article.saved == true)
        .toList();
  }

  static Future<Article?> getArticleByID(int id) async {
    String jsonString = await _getArticlesJson();
    List<dynamic> jsonList = json.decode(jsonString);

    try {
      var articleJson = jsonList.firstWhere((json) => json['id'] == id);
      return Article.fromJson(articleJson);
    } catch (e) {
      return null;
    }
  }

  static Future<void> updateSavedStatus(int id, bool saved) async {
    try {
      // Load current articles from local storage
      String jsonString = await _getArticlesJson();
      List<dynamic> jsonList = json.decode(jsonString);

      // Update the saved status
      for (var article in jsonList) {
        if (article['id'] == id) {
          article['saved'] = saved;
          break;
        }
      }

      // Write back to local file
      final file = await _getLocalFile();
      await file.writeAsString(JsonEncoder.withIndent('  ').convert(jsonList));
      print('Successfully updated article $id saved status to $saved');
      print('File path: ${file.path}');
    } catch (e) {
      print('Error updating saved status: $e');
      rethrow;
    }
  }
}
