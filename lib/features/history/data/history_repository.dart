import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryItem {
  final String id;
  final String fileName;
  final DateTime date;

  HistoryItem({required this.id, required this.fileName, required this.date});

  Map<String, dynamic> toJson() => {
    'id': id,
    'fileName': fileName,
    'date': date.toIso8601String(),
  };
}

class HistoryRepository {
  static const String key = 'secure_image_history';

  static Future<List<HistoryItem>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(key) ?? [];
    return list.map((item) {
      final map = jsonDecode(item);
      return HistoryItem(
        id: map['id'],
        fileName: map['fileName'],
        date: DateTime.parse(map['date']),
      );
    }).toList();
  }
}
