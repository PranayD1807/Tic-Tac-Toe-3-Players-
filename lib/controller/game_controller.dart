import 'package:tic_tac_toe/models/players.dart';

class GameController {
  static bool isEnd(List<List<String>> matrix) =>
      matrix.every((x) => x.every((y) => y != Players.none));

  static bool isWinner(
      {required int rowCord,
      required int colCord,
      required List<List<String>> matrix,
      required int countMatrix}) {
    // Time Complexity = 0(n)
    int ncol = 0, nrow = 0, ndiag = 0, nrdiag = 0;
    final player = matrix[rowCord][colCord];

    for (int i = 0; i < countMatrix; i++) {
      if (matrix[rowCord][i] == player) ncol++;
      if (matrix[i][colCord] == player) nrow++;
      if (matrix[i][i] == player) ndiag++;
      if (matrix[i][countMatrix - i - 1] == player) nrdiag++;
    }
    return nrow == countMatrix ||
        ncol == countMatrix ||
        ndiag == countMatrix ||
        nrdiag == countMatrix;
  }
}
