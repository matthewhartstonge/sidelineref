import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class QuarterTimingCard extends StatelessWidget {
  const QuarterTimingCard({
    Key? key,
    required this.label,
    required this.stopwatch,
    required this.isRunning,
    required this.onPlayToggled,
  }) : super(key: key);

  final String label;
  final StopWatchTimer stopwatch;
  final bool isRunning;
  final VoidCallback onPlayToggled;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stopwatch.rawTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data as int;
        final displayTime = StopWatchTimer.getDisplayTime(value);
        return Card(
          child: Column(
            children: [
              Text(label),
              Text(displayTime),
              IconButton(
                onPressed: onPlayToggled,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
