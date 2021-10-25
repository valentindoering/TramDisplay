import 'package:cli/globals.dart';

class Grid {
  List<List<int>>? _list;
  Grid.from(int width, int fillValue) {
    _list = List.generate(
        board_height, (_) => List.generate(width, (_) => fillValue));
  }

  Grid(List<List<int>> grid) {
    if (grid.length != board_height) {
      throw Exception('Cant initialize a Grid with height ${grid.length}');
    }

    var row_length = grid[0].length;
    for (var row in grid) {
      if (row.length != row_length) {
        throw Exception('Grid is not valid, the width varies');
      }
    }
    _list = grid;
  }

  @override
  String toString() {
    return _list.toString();
  }

  // Problem: grid + grid2, will assign the result to grid!
  Grid operator +(Grid other) {
    var outputGrid = _list!;
    for (var numberOfRow = 0; numberOfRow < outputGrid.length; numberOfRow++) {
      outputGrid[numberOfRow] += other.list[numberOfRow];
    }
    return Grid(outputGrid);
  }

  List<List<int>> get list {
    return _list!;
  }

  int get width {
    return _list![0].length;
  }
}
