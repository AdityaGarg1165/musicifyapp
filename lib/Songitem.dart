

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class SongItem extends StatefulWidget{
  final String q;
  const SongItem({Key? key,required this.q}) : super(key: key);


  @override
  State<SongItem> createState() => _itemState();
}

class _itemState extends State<SongItem> {


  @override
  Widget build(BuildContext context){
    return Container(child: ElevatedButton(child: Text(widget.q),onPressed: () async {
    //   const url = "https://music2-two.vercel.app/api/link";
    //   var res = await http.post(
    //     Uri.parse(url),
    //   //   headers: {
    //   // "Content-Type": "application/json",},
    //     // headers: <String, String>{
    //   // 'Content-Type': 'application/x-www-form-urlencoded',
    //   // 'Authorization':"Basic " + base64.encode(utf8.encode("2d619d57084f437aa49f91cf7197f671" + ":" + "d3ba863d303c401c84b3e8dca435704b"))

    // // },
    // body:  jsonEncode(<String, String>{
    //   'val': "https://www.youtube.com/watch?v=bk_o8N-Dzus",
    // }),
    //     );
    //   print(jsonDecode(res.body)['url']);
      
    //   print(jsonDecode(res.body)['access_token']);

    },),);
  }

}
