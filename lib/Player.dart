import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musicify_app/Search.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

import 'package:musicify_app/fetcher.dart';

class Player extends StatefulWidget {
  String id;
  Player({super.key, required this.id});

  @override
  State<Player> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Player> {
  final player = AudioPlayer();
  Future<String> start() async {
    player.stop();
    // player.noSuchMethod(invocation)
    String vidUrl = widget.id;
    // print(vidUrl);

    await player.setSource(UrlSource(vidUrl));
    await player.resume();
    player.setVolume(1);
    return "";
  }

  Future<bool> _func() async {
    return Fetcher().empty();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(32, 34, 60, .5),
            appBar: AppBar(
              title: Text("Musicify"),
              backgroundColor: Colors.indigo[500],
            ),
            body: FutureBuilder(
              future: start(),
              builder: (context, snapshot) => Text(""),
            )),
        onWillPop: () async {
          return Future(() async {
            player.dispose();
            Navigator.pop(context, false);
            return Future.value(true);
          });
        });
  }
}
