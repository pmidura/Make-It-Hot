import 'dart:convert';

List<Position> positionFromJson(String str) =>
  List<Position>.from(json.decode(str).map((x) => Position.fromJson(x)));

String positionToJson(List<Position> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Position {
  final String title;
  final String translateTitlePL;
  final String content;
  final String translateContentPL;
  final String category;
  final String translateCategoryPL;
  final String url;
  final String isRevealed;
  final String isFavourite;

  const Position({
    required this.title,
    required this.translateTitlePL,
    required this.content,
    required this.translateContentPL,
    required this.category,
    required this.translateCategoryPL,
    required this.url,
    required this.isRevealed,
    required this.isFavourite,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    title: json["title"],
    translateTitlePL: json["translateTitlePL"],
    content: json["content"],
    translateContentPL: json["translateContentPL"],
    category: json["category"],
    translateCategoryPL: json["translateCategoryPL"],
    url: json["URL"],
    isRevealed: json["isRevealed"],
    isFavourite: json["isFavourite"],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'translateTitlePL': translateTitlePL,
    'content': content,
    'translateContentPL': translateContentPL,
    'category': category,
    'translateCategoryPL': translateCategoryPL,
    'URL': url,
    'isRevealed': isRevealed,
    'isFavourite': isFavourite,
  };
}
