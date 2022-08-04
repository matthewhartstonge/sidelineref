import 'package:flutter/material.dart';

class QuarterTimingCard extends StatelessWidget {
  const QuarterTimingCard({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(label),
          Text("00:69"),
          IconButton(
            onPressed: () {
              print("button pressed");
            },
            icon: Icon(Icons.play_circle_outline),
          ),
        ],
      ),
    );
  }
}
