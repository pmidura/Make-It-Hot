import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final String title;
  final String content;
  final String image;
  final String category;

  const Position({
    required this.title,
    required this.content,
    required this.image,
    required this.category,
  });

  Position.fromJson(Map<String, dynamic> json) :
    title = json["title"] ?? "",
    content = json["content"] ?? "",
    image = json["image"] ?? "",
    category = json["category"] ?? "";

  @override
  List<Object?> get props => [title, content, image, category];

  static const empty = Position(title: "", content: "", image: "", category: "");
}
