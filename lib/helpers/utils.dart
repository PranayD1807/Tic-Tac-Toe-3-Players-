import 'package:flutter/material.dart';

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static Future showEndDialog(
          String title, BuildContext context, Function setEmptyFields) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: const Text("Press to Restart the Game"),
          actions: [
            ElevatedButton(
              onPressed: () {
                setEmptyFields();

                Navigator.pop(context);
              },
              child: const Text("Restart"),
            ),
          ],
        ),
      );
}
