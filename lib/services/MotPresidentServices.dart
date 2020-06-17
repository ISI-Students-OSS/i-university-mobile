import 'dart:convert';
import 'package:fpbm/models/MotPresident.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MotPresidentServices {

  Future<MotPresident> fetchAlbum() async {
    print("khalid");
    //here put your link to the API
    final response =
    await http.get('http://127.0.0.1:8080/mot_president/get.php');

    print("khalid_2");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("enter");
      return MotPresident.fromJson(json.decode(response.body));
    } else {
      print("enter");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}