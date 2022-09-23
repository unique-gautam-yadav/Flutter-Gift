import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:gift/pages/countdown.dart';
import 'package:gift/pages/home.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  Audio.file("sd");
  AudioWidget.file(child: child, path: path)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      // initialRoute: HomePage.route,
      initialRoute: "cd",
      routes: {
        HomePage.route: (context) => const HomePage(),
        "cd": (context) => const MyWidget(),
      },
    );
  }
}
