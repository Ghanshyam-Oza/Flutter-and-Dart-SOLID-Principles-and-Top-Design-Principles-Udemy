import 'package:design_pattern/state_design_pattern/exercises/media_player.dart';
import 'package:flutter/material.dart';

class MediaPlayerHome extends StatelessWidget {
  const MediaPlayerHome({super.key});

  @override
  Widget build(BuildContext context) {
    Player player = Player();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Player : State Design Pattern"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  color: Colors.yellow,
                  onPressed: () {
                    player.play();
                  },
                  child: const Text("Start")),
              MaterialButton(
                  color: Colors.yellow,
                  onPressed: () {
                    player.stop();
                  },
                  child: const Text("Stop")),
              MaterialButton(
                  color: Colors.yellow,
                  onPressed: () {
                    player.pause();
                  },
                  child: const Text("Pause")),
            ],
          )
        ]),
      ),
    );
  }
}
