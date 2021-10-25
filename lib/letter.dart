import 'package:cli/cli.dart';
import 'package:cli/globals.dart';
import 'package:cli/grid.dart';

class Letter {
  // Instance variables
  Char? _char;

  // Static variables
  static final _charToFreeFields = SaveMap([
    Tuple(Char('A'),
        [Tuple(4, 1), Tuple(3, 1), Tuple(1, 1), Tuple(0, 0), Tuple(0, 2)]),
    Tuple(Char('B'), [Tuple(1, 1), Tuple(3, 1), Tuple(4, 2), Tuple(0, 2), Tuple(2, 2)]),
    Tuple(Char('C'), [Tuple(3, 1), Tuple(3, 1), Tuple(2, 1), Tuple(1, 1), Tuple(2, 2)]),
    Tuple(Char('D'), [Tuple(1, 1), Tuple(2, 1), Tuple(3, 1), Tuple(0, 2), Tuple(4, 2)]),
    Tuple(Char('R'), [Tuple(0, 2), Tuple(1, 1), Tuple(2, 2), Tuple(3, 1), Tuple(4, 1)]),
    Tuple(Char('I'), [Tuple(1, 0), Tuple(2, 0), Tuple(3, 0), Tuple(1, 2), Tuple(2, 2), Tuple(3, 2)]),
    Tuple(Char('N'), [Tuple(0, 1), Tuple(4, 1), Tuple(0, 0), Tuple(4, 2), Tuple(1, 1), Tuple(3, 1)]),
    Tuple(Char('E'), [Tuple(1, 1), Tuple(1, 2), Tuple(3, 1), Tuple(3, 2)]),
    Tuple(Char('O'), [Tuple(1, 1), Tuple(2, 1), Tuple(3, 1)]),
    Tuple(Char('T'), [Tuple(1, 0), Tuple(2, 0), Tuple(3, 0), Tuple(4, 0), Tuple(1, 2), Tuple(2, 2), Tuple(3, 2), Tuple(4, 2)]),
    Tuple(Char('H'), [Tuple(0, 1), Tuple(1, 1), Tuple(3, 1), Tuple(4, 1)]),
    Tuple(Char('F'), [Tuple(4, 1), Tuple(4, 2), Tuple(3, 1), Tuple(3, 2), Tuple(1, 1), Tuple(1, 2)]),
    Tuple(Char('G'), [Tuple(3, 1), Tuple(1, 1), Tuple(1, 2), Tuple(2, 1)]),
    Tuple(Char('J'), [Tuple(0, 0), Tuple(1, 0), Tuple(2, 0), Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1)]),
    Tuple(Char('K'), [Tuple(4, 1), Tuple(0, 1), Tuple(2, 1), Tuple(2, 2), Tuple(3, 2), Tuple(1, 2)]),
    Tuple(Char('L'), [Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1), Tuple(2, 2), Tuple(1, 2), Tuple(0, 2)]),
    Tuple(Char('M'), [Tuple(0, 1), Tuple(2, 1), Tuple(3, 1), Tuple(4, 1)]),
    Tuple(Char('O'), [Tuple(1, 1), Tuple(2, 1), Tuple(3, 1)]),
    Tuple(Char('P'), [Tuple(1, 1), Tuple(3, 1), Tuple(4, 1), Tuple(4, 2), Tuple(3, 2)]),
    Tuple(Char('Q'), [Tuple(1, 1), Tuple(3, 0), Tuple(4, 0), Tuple(4, 1), Tuple(3, 2)]),
    Tuple(Char('S'), [Tuple(1, 1), Tuple(1, 2), Tuple(3, 0), Tuple(3, 1)]),
    Tuple(Char('U'), [Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1)]),
    Tuple(Char('V'), [Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1), Tuple(4, 0), Tuple(4, 2)]),
    Tuple(Char('W'), [Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(4, 1)]),
    Tuple(Char('X'), [Tuple(0, 1), Tuple(1, 1), Tuple(3, 1), Tuple(4, 1), Tuple(2, 0), Tuple(2, 2)]),
    Tuple(Char('Y'), [Tuple(0, 1), Tuple(2, 0), Tuple(3, 0), Tuple(4, 0), Tuple(2, 2), Tuple(3, 2), Tuple(4, 2), Tuple(1, 1)]),
    Tuple(Char('Z'), [Tuple(1, 0), Tuple(1, 1), Tuple(2, 0), Tuple(3, 1), Tuple(3, 2), Tuple(2, 2)]),
    Tuple(Char('Ö'), [Tuple(3, 1), Tuple(1, 0), Tuple(1, 1), Tuple(1, 2), Tuple(0, 1)]),
    Tuple(Char('Ü'), [Tuple(3, 1), Tuple(1, 0), Tuple(1, 1), Tuple(1, 2), Tuple(0, 1), Tuple(2, 1)]),
    Tuple(Char('Ä'), [Tuple(1, 0), Tuple(1, 1), Tuple(1, 2), Tuple(0, 1), Tuple(4, 1)]),
    Tuple(Char('.'), [Tuple(0, 0), Tuple(1, 0), Tuple(2, 0), Tuple(3, 0), Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1), Tuple(4, 1), Tuple(0, 2), Tuple(1, 2), Tuple(2, 2), Tuple(3, 2), Tuple(4, 2)]),
    Tuple(Char(','), [Tuple(0, 0), Tuple(1, 0), Tuple(2, 0), Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1), Tuple(4, 1), Tuple(0, 2), Tuple(1, 2), Tuple(2, 2), Tuple(3, 2), Tuple(4, 2)]),
    Tuple(Char(':'), [Tuple(0, 0), Tuple(2, 0), Tuple(4, 0), Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1), Tuple(4, 1), Tuple(0, 2), Tuple(1, 2), Tuple(2, 2), Tuple(3, 2), Tuple(4, 2)]),

  ]);

  // all: Tuple(Char(' '), [Tuple(0, 0), Tuple(1, 0), Tuple(2, 0), Tuple(3, 0), Tuple(4, 0), Tuple(0, 1), Tuple(1, 1), Tuple(2, 1), Tuple(3, 1), Tuple(4, 1), Tuple(0, 2), Tuple(1, 2), Tuple(2, 2), Tuple(3, 2), Tuple(4, 2)]),

  static void checkFreeFields(List<Tuple<int, int>> freeFields) {
    for (var tuple in freeFields) {
      if (tuple.first < 0 ||
          tuple.first >= board_height ||
          tuple.second < 0 ||
          tuple.second >= letter_width) {
        throw Exception(
            'the given freeFields List contains coords that are not in the letter range');
      }
    }
  }

  Letter(Char char) {
    if (char != Char(freeCharacter) && !Letter._charToFreeFields.has(char)) {
      throw Exception(
          'Cant construct Letter from char "$char", because no entry in the _charToFreeFields map was found.');
    }
    _char = char;
  }

  Grid getLetterGrid() {
    if (_char == Char(' ')) {
      return Grid.from(letter_width, 0);
    }
    var freeFields = Letter._charToFreeFields.get(_char!);
    Letter.checkFreeFields(freeFields);

    var letterGrid = Grid.from(letter_width, 1).list;

    for (var freeField in freeFields) {
      letterGrid[freeField.first][freeField.second] = 0;
    }
    return Grid(letterGrid);
  }
}
