import 'package:cli/board.dart';
import 'package:cli/writing.dart';

void main(List<String> arguments) {
  var board = Board();
  // A-z,.:ÖöÜü (no numbers yet)
  board.writing = Writing('Du sollst dein Kinderzimmer aufräumen');
  board.play();
}
