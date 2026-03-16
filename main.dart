import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BestQuotePage(),
  ));
}

class BestQuotePage extends StatefulWidget {
  const BestQuotePage({super.key});

  @override
  State<BestQuotePage> createState() => _BestQuotePageState();
}

class _BestQuotePageState extends State<BestQuotePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> quotes = [
    {
      "text": "The only way to do great work is to love what you do.",
      "author": "Steve Jobs"
    },
    {"text": "Stay hungry, stay foolish.", "author": "Steve Jobs"},
    {
      "text": "Innovation distinguishes between a leader and a follower.",
      "author": "Steve Jobs"
    },
    {"text": "It always seems impossible until it's done.", "author": "Nelson Mandela"},
    {
      "text": "The future belongs to those who believe in the beauty of their dreams.",
      "author": "Eleanor Roosevelt"
    },
    {"text": "Action is the foundational key to all success.", "author": "Pablo Picasso"},
  ];

  int index = 0;
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  void getNewQuote() {
    setState(() {
      index = Random().nextInt(quotes.length);
      _controller.forward(from: 0); // animate fade on new quote
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.format_quote_rounded,
              size: 100,
              color: Colors.white24,
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnim,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      quotes[index]['text']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Georgia',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "- ${quotes[index]['author']}",
                      style: const TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            // Gradient Button using Container + Ink
            GestureDetector(
              onTap: getNewQuote,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    colors: [Colors.cyanAccent, Colors.blueAccent],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.auto_awesome, size: 28, color: Colors.black87),
                    SizedBox(width: 10),
                    Text(
                      "Get Inspired",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}