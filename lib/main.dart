import 'package:flutter/material.dart';
import 'package:musicify_app/Player.dart';
import 'package:musicify_app/Search.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class SpotifyApiState with ChangeNotifier {
//  const state = 0;
  String _searchText = "sadfla";
  String get searchText => _searchText;
  String access_token = "";
  String get AccessToken => access_token;
  List<dynamic> songs = [];
  List<dynamic> get song_list => songs;
  // String songs = [];

  void UpdateSearch(val) {
    _searchText = val;
    notifyListeners();
  }

  void setAccessToken(val) {
    access_token = val;
  }

  void setSongs(val) {
    songs = val;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SpotifyApiState(),
      child: MaterialApp(home: SearchPage()),
    );
  }
}
