import 'package:flutter/foundation.dart';

class Event {
  final String title;
  final String image;
  final String description;
  final DateTime start_at;
  final String duration;

  Event({
    @required this.title,
    @required this.image,
    @required this.description,
    @required this.start_at,
    @required this.duration,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      start_at: json['start_at'] as DateTime,
      duration: json['duration'] as String,
    );
  }
}