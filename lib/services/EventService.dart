import 'dart:convert';

import 'package:fpbm/helpers/Constant.dart';
import 'package:fpbm/models/Event.dart';
import 'package:http/http.dart';


class EventService {
  final String eventsURL = Constants.API_ADDRESS + "news";

  Future<List<Event>> getEvents() async {
    Response res = await get(eventsURL);
    if (res.statusCode == 200) {
      print('----------------------------------');
      List<dynamic> body = jsonDecode(res.body);



      print('---------------------');
      List<Event> posts = body
          .map(
            (dynamic item) => Event.fromJson(item),
      )
          .toList();
      print('---------------------');
      return posts;
    } else {
      throw "Can't get events.";
    }
  }
}