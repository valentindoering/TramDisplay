// @dart=2.9
/* 
The test package doesnt support null safety. 
The comment above makes sure that it will still run.
*/

import 'package:cli/cli.dart';
import 'package:cli/grid.dart';

import 'package:test/test.dart';

void main() {
  test('Tuple', () {
    var tuple = Tuple(1, 'b');

    expect([tuple.first, tuple.second], [1, 'b']);
  });

  test('Grid addition', () {
    var gridWidth = 1;
    var grid = Grid.from(gridWidth, 0);
    expect(grid.width, gridWidth);

    var grid2 = Grid.from(gridWidth, 0);
    var doubleGrid = grid + grid2;
    expect(doubleGrid.width, gridWidth * 2);
    expect(true, true);
  });
}
