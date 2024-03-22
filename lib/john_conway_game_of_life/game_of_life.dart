import 'dart:async';

import 'package:design_pattern/john_conway_game_of_life/game_of_life_model.dart';
import 'package:design_pattern/john_conway_game_of_life/grid_renderer.dart';
import 'package:flutter/material.dart';

class GameOfLife extends StatefulWidget {
  const GameOfLife({Key? key}) : super(key: key);

  @override
  State<GameOfLife> createState() => _GameOfLifeState();
}

class _GameOfLifeState extends State<GameOfLife> {
  GOL gol = GOL();

  @override
  void initState() {
    super.initState();
    gol.setInitials();
    gol.initGrid();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        gol.isStop != true ? gol.refreshGrid() : null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generation: ${gol.generation}'),
      ),
      body: GridRenderer(columns: gol.columns, rows: gol.rows, grid: gol.grid),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gol.changeGameStatus(!gol.isStop);
        },
        child: Icon(gol.isStop == true ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
