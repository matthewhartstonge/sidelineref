import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelineref/models/app_state.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    Key? key,
    required this.type,
  }) : super(key: key);

  final TeamType type;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) => Card(
        child: Column(
          children: [
            Text(appState.getName(type)),
            Text(appState.getPoints(type).toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    appState.minusPoint(type);
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                IconButton(
                  onPressed: () {
                    appState.addPoint(type);
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
