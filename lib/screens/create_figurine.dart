import 'package:flutter/material.dart';
import 'package:my_figurines/models/figurine_model.dart';

class CreateFigurine extends StatefulWidget {
  const CreateFigurine({super.key});

  @override
  State<CreateFigurine> createState() => _CreateFigurineState();
}

class _CreateFigurineState extends State<CreateFigurine> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final noteController = TextEditingController();
  final imageUrlController = TextEditingController();

  void submitFigurine() {
    if (formKey.currentState!.validate()) {
      final createdFigurine = FigurineModel(
        id: DateTime.now().microsecondsSinceEpoch,
        name: nameController.text.trim(),
        note: noteController.text.trim(),
        imageUrl: imageUrlController.text.trim(),
        health: 100,
        damage: 20,
        block: 10,
        timeAdded: DateTime.now(),
      );

      Navigator.pop(context, createdFigurine);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        title: const Text("Create a figurine"),
        backgroundColor: const Color.fromRGBO(29, 205, 159, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter a name"
                            : null,
              ),
              TextFormField(
                controller: noteController,
                decoration: const InputDecoration(
                  labelText: "Note",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter a note / description"
                            : null,
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: const InputDecoration(
                  labelText: "Image URL",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter a image URL filepath"
                            : null,
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: submitFigurine,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(123, 201, 255, 1),
                ),
                child: const Text(
                  "Create Figurine",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}