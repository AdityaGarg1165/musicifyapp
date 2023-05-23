// import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Fetcher {
  Fetcher();

  Future<List<dynamic>> get(query, accessToken) async {
    if (accessToken == "") {
      print(accessToken);
      return [
        {"name": ""}
      ];
    } else {
      print(accessToken);
      var res = await http.get(
          Uri.parse(
              "https://api.spotify.com/v1/search?q=" + query + "&type=album"),
          headers: <String, String>{'Authorization': "Bearer " + accessToken});
      var body = jsonDecode(res.body);
      // print("body");
      // print(body);
      var items = body['albums']['items'];
      // print(accessToken == "d");

      // return [];
      return items;
    }
    // return ["{}, ];
  }
}
