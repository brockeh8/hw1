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
  double? first;
  String? op;
  bool waitingForSecond = false;

  // helpers
  VoidCallback onDigit(String d) => () => tapDigit(d);
  VoidCallback onOp(String o)    => () => tapOp(o);

  // logic
  void clearAll() { setState(() { display = '0'; first = null; op = null; waitingForSecond = false; }); }

  void tapDigit(String d) {
    setState(() {
      if (waitingForSecond) { display = d; waitingForSecond = false; return; }
      display = display == '0' ? d : display + d;
    });
  }

  void tapOp(String o) { first = double.tryParse(display) ?? 0; op = o; waitingForSecond = true; setState(() {}); }

  String pretty(double v) => v == v.roundToDouble() ? v.toInt().toString() : v.toString();

  void equals() {
    if (first == null || op == null) return;
    final second = double.tryParse(display) ?? 0;
    double? res;
    switch (op) {
      case '+': res = first! + second; break;
      case '-': res = first! - second; break;
      case '*': res = first! * second; break;
      case '/':
        if (second == 0) { setState(() { display = 'Error'; first = null; op = null; waitingForSecond = false; }); return; }
        res = first! / second; break;
    }
    setState(() { display = pretty(res ?? 0); first = null; op = null; waitingForSecond = false; });
  }

  // UI
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
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(16),
                child: Text(display, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              ),
            ),
            Row(children: [
              Expanded(child: btn('C', clearAll)),
              Expanded(child: btn('/', onOp('/'))),
            ]),
            Row(children: [
              Expanded(child: btn('7', onDigit('7'))),
              Expanded(child: btn('8', onDigit('8'))),
              Expanded(child: btn('9', onDigit('9'))),
              Expanded(child: btn('*', onOp('*'))),
            ]),
            Row(children: [
              Expanded(child: btn('4', onDigit('4'))),
              Expanded(child: btn('5', onDigit('5'))),
              Expanded(child: btn('6', onDigit('6'))),
              Expanded(child: btn('-', onOp('-'))),
            ]),
            Row(children: [
              Expanded(child: btn('1', onDigit('1'))),
              Expanded(child: btn('2', onDigit('2'))),
              Expanded(child: btn('3', onDigit('3'))),
              Expanded(child: btn('+', onOp('+'))),
            ]),
            Row(children: [
              Expanded(child: btn('0', onDigit('0'))),
              Expanded(child: btn('=', equals)),
            ]),
          ],
        ),
      ),
    );
  }
}
