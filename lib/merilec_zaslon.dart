import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void startTimer() {
    stopwatch.start();

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        setState(() {});
      },
    );
  }

  void stopTimer() {
    stopwatch.stop();
    timer?.cancel();
    setState(() {});
  }

  void resetTimer() {
    stopwatch.reset();
    timer?.cancel();
    setState(() {});
  }

  String formatTime() {
    int hours = stopwatch.elapsed.inHours;
    int minutes = stopwatch.elapsed.inMinutes % 60;
    int seconds = stopwatch.elapsed.inSeconds % 60;

    return "$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Merjenje časa dela"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Delovni čas:",
              style: TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 20),

            Text(
              formatTime(),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text("Začni merjenje časa"),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: stopTimer,
                  child: const Text("Končaj"),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: resetTimer,
                  child: const Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}