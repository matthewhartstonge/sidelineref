import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class QuarterTimingCard extends StatefulWidget {
  const QuarterTimingCard({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  State<QuarterTimingCard> createState() => _QuarterTimingCardState();
}

class _QuarterTimingCardState extends State<QuarterTimingCard> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  void toggleTimer() {
    if (!isRunning) {
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
      setState(() {
        isRunning = true;
      });
    } else {
      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
      setState(() {
        isRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data as int;
        final displayTime = StopWatchTimer.getDisplayTime(value);
        return Card(
          child: Column(
            children: [
              Text(widget.label),
              Text(displayTime),
              IconButton(
                onPressed: () => toggleTimer(),
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
