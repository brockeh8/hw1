import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(debugShowCheckedModeBanner: false, home: CalculatorScreen());
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';

  // simple button factory
  Widget btn(String t, VoidCallback onPressed) => Padding(
        padding: const EdgeInsets.all(6),
        child: TextButton(
          style: TextButton.styleFrom(padding: const EdgeInsets.all(20), backgroundColor: Colors.grey[200]),
          onPressed: onPressed,
          child: Text(t, style: const TextStyle(fontSize: 22)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // display
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(16),
                child: Text(display, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              ),
            ),

            // rows (handlers empty for now)
            Row(children: [Expanded(child: btn('C', () {})), Expanded(child: btn('/', () {}))]),
            Row(children: [
              Expanded(child: btn('7', () {})),
              Expanded(child: btn('8', () {})),
              Expanded(child: btn('9', () {})),
              Expanded(child: btn('*', () {})),
            ]),
            Row(children: [
              Expanded(child: btn('4', () {})),
              Expanded(child: btn('5', () {})),
              Expanded(child: btn('6', () {})),
              Expanded(child: btn('-', () {})),
            ]),
            Row(children: [
              Expanded(child: btn('1', () {})),
              Expanded(child: btn('2', () {})),
              Expanded(child: btn('3', () {})),
              Expanded(child: btn('+', () {})),
            ]),
            Row(children: [
              Expanded(child: btn('0', () {})),
              Expanded(child: btn('=', () {})),
            ]),
          ],
        ),
      ),
    );
  }
}
