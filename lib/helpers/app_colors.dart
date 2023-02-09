import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/players.dart';

class AppColors {
  static Color getBackgroundColor(String lastMove) {
    switch (lastMove) {
      case Players.player1:
        return getFieldColor(Players.player2).withAlpha(150);

      case Players.player2:
        return getFieldColor(Players.player3).withAlpha(150);

      case Players.player3:
        return getFieldColor(Players.player1).withAlpha(150);

      default:
        return getFieldColor(Players.player1).withAlpha(150);
    }
  }

  static Color getFieldColor(String value) {
    switch (value) {
      case Players.player1:
        return Colors.red;

      case Players.player2:
        return Colors.blue;

      case Players.player3:
        return Colors.green;

      default:
        return Colors.white;
    }
  }
}
