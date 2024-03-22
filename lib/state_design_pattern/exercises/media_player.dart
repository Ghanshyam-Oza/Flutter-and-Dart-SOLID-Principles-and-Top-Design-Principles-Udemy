import 'package:flutter/foundation.dart';

abstract class PlayerState {
  void play(Player player);
  void stop(Player player);
  void pause(Player player);
}

class StoppedState implements PlayerState {
  @override
  void play(Player player) {
    player.setState(PlayingState());
    player.play();
  }

  @override
  void stop(Player player) {
    debugPrint("Stopped Player");
  }

  @override
  void pause(Player player) {
    player.setState(PausedState());
    player.pause();
  }
}

class PlayingState implements PlayerState {
  @override
  void play(Player player) {
    debugPrint("Playing Player");
  }

  @override
  void stop(Player player) {
    player.setState(StoppedState());
    player.stop();
  }

  @override
  void pause(Player player) {
    player.setState(PausedState());
    player.pause();
  }
}

class PausedState implements PlayerState {
  @override
  void play(Player player) {
    player.setState(PlayingState());
    player.play();
  }

  @override
  void stop(Player player) {
    player.setState(StoppedState());
    player.stop();
  }

  @override
  void pause(Player player) {
    debugPrint("Paused Player");
  }
}

class Player {
  late PlayerState _state;

  Player() {
    _state = PlayingState();
  }

  void setState(PlayerState state) {
    _state = state;
  }

  void play() {
    _state.play(this);
  }

  void stop() {
    _state.stop(this);
  }

  void pause() {
    _state.pause(this);
  }
}
