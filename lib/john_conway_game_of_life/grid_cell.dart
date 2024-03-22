import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  const GridCell({
    super.key,
    required List<List<int>> grid,
    required this.row,
    required this.column,
    required int alive,
  })  : _grid = grid,
        _alive = alive;

  final List<List<int>> _grid;
  final int row;
  final int column;
  final int _alive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _grid[row][column] == _alive ? Colors.black : Colors.white,
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
