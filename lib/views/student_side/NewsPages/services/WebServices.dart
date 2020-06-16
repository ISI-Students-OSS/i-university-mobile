import 'dart:convert';
import 'package:fpbm/views/student_side/NewsPages/models/NewsArticle.dart';
import 'package:http/http.dart' as http;

class WebsService {

  final String url = "http://192.168.1.5:8000/api/v1/news";

  Future<List<Articls>> getArticls() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Articls> news = body
          .map(
            (dynamic item) => Articls.fromJSON(item),
          )
          .toList();

      return news;
    } else {
      throw Exception("Failed to get the News");
    }
  }
}
