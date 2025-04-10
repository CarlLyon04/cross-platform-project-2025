import 'package:flutter/material.dart';
import 'package:my_figurines/models/figurine_model.dart';

class CreateFigurine extends StatefulWidget {
  const CreateFigurine({super.key});

  @override
  State<CreateFigurine> createState() => _CreateFigurineState();
}

class _CreateFigurineState extends State<CreateFigurine> {
  final nameController = TextEditingController();
  final noteController = TextEditingController();
  final imageUrlController = TextEditingController();

  void submitFigurine() {
    final name = nameController.text.trim();
    final note = noteController.text.trim();
    final imageUrl = imageUrlController.text.trim();

    if (name.isEmpty || note.isEmpty || imageUrl.isEmpty) return;

    final createdFigurine = FigurineModel(
      id: DateTime.now().microsecondsSinceEpoch,
      name: name,
      note: note,
      imageUrl: imageUrl,
      timeAdded: DateTime.now(),
    );

    Navigator.pop(context, createdFigurine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        title: const Text("Create a figurine"),
        backgroundColor: const Color.fromRGBO(29,205, 159, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name", labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
            style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: "Note", labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: "Image URL", labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: submitFigurine,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(123, 201, 255, 1),
              ),
              child: const Text("Create Figurine", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
