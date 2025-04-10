import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 239, 231, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 53, 85, 1),
        title: const Text(
          "My Figurines",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SizedBox.expand(),
    );
  }
}
