import 'package:cli/cli.dart';
import 'package:cli/globals.dart';
import 'package:cli/grid.dart';
import 'package:cli/letter.dart';

class Writing {
  List<Letter>? _letterList;

  static final Grid _separationGrid = Grid.from(1, 0);
  Writing(String sentence) {
    sentence = sentence.toUpperCase();
    var stringList = sentence.split('');
    var letterList = stringList.map((str) => Letter(Char(str))).toList();
    _letterList = letterList;
  }

  Grid getWritingGrid() {
    var writingGrid = Grid(List.generate(board_height, (_) => []));
    _letterList!.forEach((letter) {
      writingGrid += Writing._separationGrid;
      writingGrid += letter.getLetterGrid();
    });
    return writingGrid;
  }

  void addString(String newStr) {
    newStr = newStr.toUpperCase();
    var stringList = newStr.split('');
    var letterListNew = stringList.map((str) => Letter(Char(str))).toList();
    _letterList = _letterList! + letterListNew;
  }
}
