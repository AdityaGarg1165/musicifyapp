import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musicify_app/Player.dart';

class SongItem extends StatefulWidget {
  String name1;
  String url;
  SongItem({super.key, required this.name1, required this.url});

  @override
  State<SongItem> createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  // String name = widget.n
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1000,
        child: ListTile(
          onTap: () async {
            if (widget.name1 != " ") {
              var songName = widget.name1;
              var res = await http.post(
                  Uri.parse("https://music2-two.vercel.app/api/get"),
                  body: '{"val":"$songName"}');
              String vidUrl = jsonDecode(res.body)["url"];

              var resu = await http.post(
                  Uri.parse("https://music2-two.vercel.app/api/link"),
                  body: '{"val":"$vidUrl/"}');
              var url = jsonDecode(resu.body)['url'];

              // print(url);
              // print(jsonDecode(resu.body)['url']);
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (ctxt) => new Player(id: url),
                  ));
            }
          },
          // tileColor: new Color.fromRGBO(56, 57, 84, 1),
          // minVerticalPadding: 12,

          title: RichText(
            maxLines: 12000,
            text: TextSpan(
                text: widget.name1, style: TextStyle(color: Colors.white)),
            softWrap: false,
          ),
          leading: Image.network(widget.url),
        ));
  }
}
