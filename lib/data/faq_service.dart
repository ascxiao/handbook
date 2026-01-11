import 'dart:convert';
import 'package:flutter/services.dart';

class Faq {
  final int id;
  final String question;
  final String answer;

  Faq({required this.id, required this.question, required this.answer});

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}

class FaqService {
  static Future<String> _getFaqsJson() async {
    // Always read from bundled asset
    return await rootBundle.loadString('assets/faqs/faqs.json');
  }

  static Future<List<Faq>> loadFaqs() async {
    String jsonString = await _getFaqsJson();
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Faq.fromJson(json)).toList();
  }

  static Future<Faq?> getFaqByID(int id) async {
    String jsonString = await _getFaqsJson();
    List<dynamic> jsonList = json.decode(jsonString);

    try {
      var FaqJson = jsonList.firstWhere((json) => json['id'] == id);
      return Faq.fromJson(FaqJson);
    } catch (e) {
      return null;
    }
  }
}
