import 'package:flutter/foundation.dart';

class Articls {
  final int id;
  final String title;
  final String description;
  final String image;
  final String scholarYear;
  final String publishedAt;

  Articls({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.scholarYear,
    @required this.publishedAt,

  });

  factory Articls.fromJSON(Map<String, dynamic> json) {
    return Articls(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      scholarYear: json['scholar_year_id'] as String,
      publishedAt: json['published_at'] as String,
    );
  }
}
