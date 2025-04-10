import 'package:flutter/material.dart';
import 'package:my_figurines/cards/figurine_card.dart';
import 'package:my_figurines/models/figurine_model.dart';

class Home extends StatelessWidget {
 Home({super.key});

  final List<FigurineModel> figurinesTest = [
    FigurineModel(
      id: 1,
      name: "Figure 1",
      note: "Note 1",
      imageUrl: "abc",
      timeAdded: DateTime(2025, 4, 10)
    ),
      FigurineModel(
      id: 2,
      name: "Figure 2",
      note: "Note 2",
      imageUrl: "def",
      timeAdded: DateTime(2025, 3, 10)
    )
  ];

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
      body: ListView.builder(
        itemCount: figurinesTest.length,
        itemBuilder: (context, index) {
          final figurine = figurinesTest[index];
          return FigurineCard(figurine: figurine);
        }
      ),
    );
  }
}
