import 'dart:convert';

List<Position> positionFromJson(String str) =>
  List<Position>.from(json.decode(str).map((x) => Position.fromJson(x)));

String positionToJson(List<Position> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Position {
  final String title;
  final String content;
  final String translateContentPL;
  final String category;
  final String isRevealed;
  final String isFavourite;

  const Position({
    required this.title,
    required this.content,
    required this.translateContentPL,
    required this.category,
    required this.isRevealed,
    required this.isFavourite,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    title: json["title"],
    content: json["content"],
    translateContentPL: json["translateContentPL"],
    category: json["category"],
    isRevealed: json["isRevealed"],
    isFavourite: json["isFavourite"],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'translateContentPL': translateContentPL,
    'category': category,
    'isRevealed': isRevealed,
    'isFavourite': isFavourite,
  };
}
