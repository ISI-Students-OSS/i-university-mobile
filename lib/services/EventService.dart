import 'dart:convert';

import 'package:fpbm/helpers/Constant.dart';
import 'package:fpbm/models/Event.dart';
import 'package:http/http.dart';


class EventService {
  final String eventsURL = Constants.API_ADDRESS + "events";

  Future<List<Event>> getEvents() async {
    Response res = await get(eventsURL);
    if (res.statusCode == 200) {
      print('---------------1-------------------');
      List<dynamic> body = jsonDecode(res.body);
      print('----------2-----------');
      List<Event> posts = body.map((dynamic item) => Event.fromJson(item)).toList();
      print('-------3--------------');
      return posts;
    } else {
      throw "Can't get events.";
    }
  }
}