import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelineref/components/quarter_timing_card.dart';
import 'package:sidelineref/components/score_card.dart';
import 'package:sidelineref/providers/app_state.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StopWatchTimer _stopWatchTimerQ1 = StopWatchTimer();
  bool isRunningQ1 = false;
  final StopWatchTimer _stopWatchTimerQ2 = StopWatchTimer();
  bool isRunningQ2 = false;
  final StopWatchTimer _stopWatchTimerQ3 = StopWatchTimer();
  bool isRunningQ3 = false;
  final StopWatchTimer _stopWatchTimerQ4 = StopWatchTimer();
  bool isRunningQ4 = false;

  void toggleStopwatch(StopWatchTimer sw, bool isRunning) {
    if (!isRunning) {
      sw.onExecute.add(StopWatchExecute.start);
    } else {
      sw.onExecute.add(StopWatchExecute.stop);
    }
  }

  void resetTimers() {
    _stopWatchTimerQ1.onExecute.add(StopWatchExecute.reset);
    _stopWatchTimerQ2.onExecute.add(StopWatchExecute.reset);
    _stopWatchTimerQ3.onExecute.add(StopWatchExecute.reset);
    _stopWatchTimerQ4.onExecute.add(StopWatchExecute.reset);
    setState(() {
      isRunningQ1 = false;
      isRunningQ2 = false;
      isRunningQ3 = false;
      isRunningQ4 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                Text("SidelineRef"),
              ],
            ),
            Row(
              children: [
                Text("Timers"),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: QuarterTimingCard(
                    label: "Q1",
                    stopwatch: _stopWatchTimerQ1,
                    isRunning: isRunningQ1,
                    onPlayToggled: () {
                      toggleStopwatch(_stopWatchTimerQ1, isRunningQ1);
                      setState(() {
                        isRunningQ1 = !isRunningQ1;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: QuarterTimingCard(
                    label: "Q2",
                    stopwatch: _stopWatchTimerQ2,
                    isRunning: isRunningQ2,
                    onPlayToggled: () {
                      toggleStopwatch(_stopWatchTimerQ2, isRunningQ2);
                      setState(() {
                        isRunningQ2 = !isRunningQ2;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: QuarterTimingCard(
                    label: "Q3",
                    stopwatch: _stopWatchTimerQ3,
                    isRunning: isRunningQ3,
                    onPlayToggled: () {
                      toggleStopwatch(_stopWatchTimerQ3, isRunningQ3);
                      setState(() {
                        isRunningQ3 = !isRunningQ3;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: QuarterTimingCard(
                    label: "Q4",
                    stopwatch: _stopWatchTimerQ4,
                    isRunning: isRunningQ4,
                    onPlayToggled: () {
                      toggleStopwatch(_stopWatchTimerQ4, isRunningQ4);
                      setState(() {
                        isRunningQ4 = !isRunningQ4;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Scores"),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ScoreCard(
                    type: TeamType.home,
                  ),
                ),
                Expanded(
                  child: ScoreCard(
                    type: TeamType.away,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text("Reset Timers"),
                            onPressed: () {
                              resetTimers();
                            },
                          ),
                        ),
                        Container(width: 8.0),
                        Expanded(
                          child: Consumer<AppState>(
                            builder: (context, appState, child) =>
                                ElevatedButton(
                              child: Text("Reset Points"),
                              onPressed: () {
                                appState.resetPoints();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<AppState>(
                  builder: (context, appState, child) => ElevatedButton(
                    child: Text("Reset All"),
                    onPressed: () {
                      resetTimers();
                      appState.resetPoints();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
