import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controller/game_controller.dart';
import 'package:tic_tac_toe/helpers/app_colors.dart';
import 'package:tic_tac_toe/helpers/utils.dart';
import 'package:tic_tac_toe/models/players.dart';

class GameMainScreen extends StatefulWidget {
  const GameMainScreen({super.key});

  @override
  State<GameMainScreen> createState() => _GameMainScreenState();
}

class _GameMainScreenState extends State<GameMainScreen> {
  static const countMatrix = 4;
  static const double size = 92;
  String lastMove = Players.none;
  late List<List<String>> matrix;

  void setEmptyFields() {
    setState(() {
      lastMove = Players.none;
      matrix = List.generate(
        countMatrix,
        (_) => List.generate(
          countMatrix,
          (_) => Players.none,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    setEmptyFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(lastMove),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.getBackgroundColor(lastMove),
        title: const Text("Tic-Tac-Toe (3 Players)"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Next Turn : ${getNextTurn()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      Utils.modelBuilder(matrix, (x, value) => buildRow(x)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(int x) {
    final values = matrix[x];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: Utils.modelBuilder(
        values,
        (y, value) => buildField(x, y),
      ),
    );
  }

  Widget buildField(int x, int y) {
    final String value = matrix[x][y];
    final Color color = AppColors.getFieldColor(value);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(size, size),
          backgroundColor: color,
        ),
        onPressed: () => selectField(value, x, y),
        child: Text(
          value,
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }

  String getNextTurn() {
    switch (lastMove) {
      case Players.player1:
        return Players.player2;

      case Players.player2:
        return Players.player3;

      case Players.player3:
        return Players.player1;

      default:
        return Players.player1;
    }
  }

  void selectField(String value, int x, int y) {
    if (value == Players.none) {
      String newValue = getNextTurn();
      setState(() {
        matrix[x][y] = newValue;
        lastMove = newValue;
      });
      if (GameController.isWinner(
          rowCord: x, colCord: y, matrix: matrix, countMatrix: countMatrix)) {
        Utils.showEndDialog('Player ($newValue) Won', context, setEmptyFields);
      } else if (GameController.isEnd(matrix)) {
        Utils.showEndDialog("Undecided Game", context, setEmptyFields);
      }
    }
  }
}
