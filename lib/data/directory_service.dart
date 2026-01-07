import 'dart:convert';
import 'package:flutter/services.dart';

class Directory {
  final int id;
  final String office;
  final String contactInfo;

  Directory({
    required this.id,
    required this.office,
    required this.contactInfo,
  });

  factory Directory.fromJson(Map<String, dynamic> json) {
    return Directory(
      id: json['id'],
      office: json['office'],
      contactInfo: json['contactInfo'],
    );
  }
}

class DirectoryService {
  static Future<String> _getDirectoriesJson() async {
    // Always read from bundled asset
    return await rootBundle.loadString('assets/directory/directory.json');
  }

  static Future<List<Directory>> loadDirectories() async {
    String jsonString = await _getDirectoriesJson();
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Directory.fromJson(json)).toList();
  }

  static Future<Directory?> getDirectoryByID(int id) async {
    String jsonString = await _getDirectoriesJson();
    List<dynamic> jsonList = json.decode(jsonString);

    try {
      var DirectoryJson = jsonList.firstWhere((json) => json['id'] == id);
      return Directory.fromJson(DirectoryJson);
    } catch (e) {
      return null;
    }
  }
}
