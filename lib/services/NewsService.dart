import 'dart:convert';
import 'package:fpbm/models/NewsArticle.dart';
import 'package:http/http.dart' as http;
import 'package:fpbm/helpers/Constant.dart';


class NewsService {

  final String url = Constants.API_ADDRESS + "news";

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
