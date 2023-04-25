import 'dart:convert';

List<Position> positionFromJson(String str) =>
  List<Position>.from(json.decode(str).map((x) => Position.fromJson(x)));

String positionToJson(List<Position> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Position {
  final String title;
  final String content;
  final String image;
  final String category;
  final String isRevealed;

  const Position({
    required this.title,
    required this.content,
    required this.image,
    required this.category,
    required this.isRevealed,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    title: json["title"],
    content: json["content"],
    image: json["image"],
    category: json["category"],
    isRevealed: json["isRevealed"],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'image': image,
    'category': category,
    'isRevealed': isRevealed,
  };
}
