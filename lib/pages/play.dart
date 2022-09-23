import 'package:flutter/material.dart';


class MusicPage extends StatelessWidget {
  const MusicPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child:
                ElevatedButton(onPressed: () {}, child: const Text("Press it")),
          )
        ],
      ),
    );
  }
}
