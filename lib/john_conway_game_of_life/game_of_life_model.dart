import 'dart:math';

abstract class GameOfLifeClass {
  List<List<int>> grid = [];
  int rows = 0;
  int columns = 0;
  int generation = 0;
  bool isStop = true;
  Random genLife = Random();
  int alive = 1;
  int dead = 0;

  setInitials();
  void initGrid();
  int countAliveNeighbors(int row, int column);
  void refreshGrid();
  void changeGameStatus(bool isStop);
}

class GOL implements GameOfLifeClass {
  @override
  int columns = 0;

  @override
  int generation = 0;

  @override
  List<List<int>> grid = [];

  @override
  int rows = 0;

  @override
  Random genLife = Random();

  @override
  bool isStop = true;

  @override
  int alive = 1;

  @override
  int dead = 0;

  @override
  setInitials() {
    rows = 30;
    columns = 30;
    generation = 0;
  }

  @override
  void initGrid() {
    grid = List.generate(rows, (_) => List.filled(columns, dead));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        grid[i][j] = genLife.nextBool() ? 1 : 0;
      }
    }
  }

  @override
  int countAliveNeighbors(int row, int column) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        int r = row + i;
        int c = column + j;
        if (r >= 0 &&
            r < rows &&
            c >= 0 &&
            c < columns &&
            grid[r][c] == alive) {
          count++;
        }
      }
    }
    return count;
  }

  @override
  void refreshGrid() {
    generation++;
    List<List<int>> nextGrid =
        List.generate(rows, (_) => List.filled(columns, 0));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        int neighbors = countAliveNeighbors(i, j);
        if (grid[i][j] == alive) {
          if (neighbors == 2 || neighbors == 3) {
            nextGrid[i][j] = alive;
          } else {
            nextGrid[i][j] = dead;
          }
        } else {
          if (neighbors == 3) {
            nextGrid[i][j] = alive;
          } else {
            nextGrid[i][j] = dead;
          }
        }
      }
    }
    grid = nextGrid;
  }

  @override
  void changeGameStatus(bool isStop) {
    this.isStop = isStop;
  }
}
