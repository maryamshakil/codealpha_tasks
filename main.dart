import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: QuotePage(), debugShowCheckedModeBanner: false));

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final List<String> quotes = [
    "The only way to do great work is to love what you do.",
    "Stay hungry, stay foolish.",
    "Innovation distinguishes between a leader and a follower.",
    "Your time is limited, so don't waste it living someone else's life.",
    "The future belongs to those who believe in the beauty of their dreams."
  ];

  String currentQuote = "Tap the button for inspiration!";

  void nextQuote() {
    setState(() {
      currentQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CodeAlpha Quote App"), backgroundColor: Colors.blueAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(currentQuote, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: nextQuote, child: Text("New Quote")),
          ],
        ),
      ),
    );
  }
}