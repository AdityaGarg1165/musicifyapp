import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicify_app/Songitem.dart';
import 'package:http/http.dart' as http;
import 'package:musicify_app/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _MyState();
}

class _MyState extends State<SearchPage> {
  List<dynamic> songs = [
    {"name": "a"},
    {"name": "a"},
    {"name": "a"},
    {"name": "a"},
    {"name": "a"},
    {"name": "a"}
  ];
  // String searched = "";
  // List<String>
  String accessToken = "";

  @override
  Widget build(BuildContext context) {
    final finalProvider = Provider.of<SpotifyApiState>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 34, 60, .5),
      appBar: AppBar(
        title: Text("Musicify"),
        backgroundColor: Colors.indigo[500],
      ),
      body: Stack(children: [
        Container(
            alignment: Alignment(0, -0.95),
            child: SizedBox(
                width: 400,
                child: TextField(
                    onTap: () async {
                      const url = "https://accounts.spotify.com/api/token";
                      var res = await http.post(Uri.parse(url),
                          headers: <String, String>{
                            'Content-Type': 'application/x-www-form-urlencoded',
                            'Authorization': "Basic " +
                                base64.encode(utf8.encode(
                                    "2d619d57084f437aa49f91cf7197f671" +
                                        ":" +
                                        "d3ba863d303c401c84b3e8dca435704b"))
                          },
                          body: "grant_type=client_credentials");
                      // finalProvider.UpdateSearch(value);
                      setState(() {
                        // searched = value;
                        finalProvider.setAccessToken(
                            jsonDecode(res.body)['access_token']);
                        // print(accessToken);
                        // print(value);
                        // searched = "sd";
                      });
                      print(songs);
                    },
                    onChanged: (value) async {
                      var url = "https://api.spotify.com/v1/search?q=" +
                          value +
                          "&type=album&limit=4";
                      var res = await http.get(
                        Uri.parse(url),
                        headers: <String, String>{
                          'Authorization': "Bearer " + finalProvider.AccessToken
                        },
                      );
                      // if (value != null) {
                      setState(() {
                        songs = jsonDecode(res.body)['albums']['items'];
                      });
                      // print(songs);
                      // }
                      // finalProvider
                      //     .setSongs(jsonDecode(res.body)['albums']['items']);
                      // print(finalProvider.song_list);
                    },
                    cursorColor: Color.fromRGBO(147, 43, 222, 1),
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Search for songs",
                        suffixIconColor: Color.fromRGBO(147, 43, 222, 1),
                        fillColor: Color.fromRGBO(56, 57, 84, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        suffixIcon: const Icon(Icons.search))))),

        // ListView.builder(
        //     itemBuilder: ((context, index) {
        //       return Row(
        //         children: [Text(songs[index]['name'])],
        //       );
        //     }),
        //     itemCount: 5)
        // SongItem(q: finalProvider.searchText)
      ]),
    );
  }
}
