import 'package:flutter/material.dart';
import 'package:musicify_app/Search.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Player> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Musicify"),
      ),
    );
  }
}
