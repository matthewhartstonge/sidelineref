import 'package:flutter/material.dart';
import 'package:sidelineref/components/quarter_timing_card.dart';
import 'package:sidelineref/components/score_card.dart';
import 'package:sidelineref/models/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  ),
                ),
                Expanded(
                  child: QuarterTimingCard(
                    label: "Q2",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: QuarterTimingCard(
                    label: "Q3",
                  ),
                ),
                Expanded(
                  child: QuarterTimingCard(
                    label: "Q4",
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
          ],
        ),
      ),
    );
  }
}
