import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CalculatorApp',
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}
//starter class
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0'; //tbd
  
  //bb scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          alignment: Alignment.bottomRight,
          child: Text(
            _display,
            style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
