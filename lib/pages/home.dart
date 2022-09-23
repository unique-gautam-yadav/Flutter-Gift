import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomePage extends StatefulWidget {
  static String route = "/home";
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ConfettiController controller = ConfettiController();
  bool st = false;
  bool gif = false;
  double angle = 0;
  double s = 300;
  int val = 0;
  @override
  void initState() {
    super.initState();
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audios/song1.mp3"),
      autoStart: true,
      showNotification: false,
      loopMode: LoopMode.none,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 150),
            child: ElevatedButton(
              style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () async {
                setState(() {
                  st = !st;
                  gif = !gif;
                });
                //controller.play();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Happy Birthday 🎉 Dear 💖💖",
                  ),
                  dismissDirection: DismissDirection.horizontal,
                ));
              },
              child: Center(
                child: AnimatedContainer(
                    height: gif ? 0 : 500,
                    width: gif ? 0 : 500,
                    duration: const Duration(milliseconds: 400),
                    child: st
                        ? Image.asset("assets/images/gift.jpg",
                            fit: BoxFit.contain)
                        : Image.asset("assets/images/gift-close.jpg",
                            fit: BoxFit.contain)),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: !st ? 0 : 400,
            height: !st ? 0 : 400,
            child: Image.asset("assets/images/bday.gif"),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: controller,
            shouldLoop: true,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.05,
            numberOfParticles: 20,
            maxBlastForce: 30,
          ),
        ),
      ]),
    );
  }
}
