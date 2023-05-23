import 'dart:convert';

List<Position> positionFromJson(String str) =>
  List<Position>.from(json.decode(str).map((x) => Position.fromJson(x)));

String positionToJson(List<Position> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Position {
  final String title;
  final String content;
  final String category;
  final String isRevealed;

  const Position({
    required this.title,
    required this.content,
    required this.category,
    required this.isRevealed,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    title: json["title"],
    content: json["content"],
    category: json["category"],
    isRevealed: json["isRevealed"],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'category': category,
    'isRevealed': isRevealed,
  };
}
