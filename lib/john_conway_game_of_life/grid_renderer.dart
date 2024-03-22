import 'package:design_pattern/john_conway_game_of_life/grid_cell.dart';
import 'package:flutter/material.dart';

class GridRenderer extends StatelessWidget {
  const GridRenderer({
    super.key,
    required int columns,
    required int rows,
    required List<List<int>> grid,
  })  : _columns = columns,
        _rows = rows,
        _grid = grid;

  final int _columns;
  final int _rows;
  final List<List<int>> _grid;
  final int _alive = 1;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: _columns,
      children: List.generate(_rows * _columns, (index) {
        int row = index ~/ _columns;
        int column = index % _columns;
        return GridCell(grid: _grid, row: row, column: column, alive: _alive);
      }),
    );
  }
}
