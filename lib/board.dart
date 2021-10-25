import 'dart:io';

import 'package:cli/globals.dart';
import 'package:cli/grid.dart';
import 'package:cli/writing.dart';

class Board {
  Writing _writing = Writing('');

  static final _upperLine = List<List<int>>.generate(
      1, (_) => List<int>.generate(board_width + 6, (_) => 1));
  static final _freeLine = List<List<int>>.generate(
      1,
      (_) => List<int>.generate(board_width + 6, (int index) {
            if (index == 0 || index == board_width + 5) {
              return 1;
            }
            return 0;
          }));

  set writing(Writing writing) {
    _writing = writing;
  }

  void play() {
    var displayGrids = createDisplayGridsFromWriting(_writing);
    var boardLists =
        displayGrids.map((displayGrid) => getBoardListFromGrid(displayGrid));

    boardLists.forEach((boardList) {
      _print_boardList(boardList);
      sleep(const Duration(milliseconds: 35));
    });
  }

  List<Grid> createDisplayGridsFromWriting(Writing writing) {
    var grid = writing.getWritingGrid();
    var gridWidth = grid.width;
    if (gridWidth <= board_width) {
      var addSpaces = (board_width - gridWidth).toInt();
      var gridList = grid + Grid.from(addSpaces, 0);
      return [gridList];
    }

    // for round Lists add Space at the end
    writing.addString('    ');
    grid = writing.getWritingGrid();
    gridWidth = grid.width;

    var doubleGrid = grid + grid;
    var gridList = doubleGrid.list;
    var interval = board_width;
    var roundSublists = [];

    for (var i = 0; i <= gridWidth; i++) {
      var sublist =
          gridList.map((row) => row.sublist(i, i + interval)).toList();
      roundSublists.add(sublist);
    }

    // leave the first view in for some time, than rotate
    var numberOfFirstLists = 50;
    var firstSublists =
        List.generate(numberOfFirstLists, (_) => roundSublists[0]);

    var firstSubgrids = firstSublists.map((e) => Grid(e)).toList();
    var roundSubgrids = roundSublists.map((e) => Grid(e)).toList();

    return firstSubgrids + roundSubgrids;
  }

  List<List<int>> getBoardListFromGrid(Grid displayGrid) {
    if (displayGrid.width != board_width) {
      throw Exception(
          'Cant create BoardList, because displayGrid has the wrong width');
    }

    var grid = displayGrid.list;
    grid = grid.map((row) => [1, 0, 0] + row + [0, 0, 1]).toList();
    return _upperLine + _freeLine + grid + _freeLine + _upperLine;
  }

  void _print_boardList(List<List<int>> boardList) {
    boardList.forEach((row) {
      var output_row = '';
      row.forEach((value) {
        if (value != 1) {
          output_row += freeCharacter;
        } else {
          output_row += blockCharacter;
        }
      });
      print(output_row);
    });
  }
}
