import 'package:flutter/material.dart';
import 'package:my_figurines/models/figurine_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

// Form screen where user creates and submits a new figurine
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

  File? imageFile; // Holds the camera image file

  // Opens camera and captures photo, saving path to imageFile and controller
  Future<void> takePhoto() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
        imageUrlController.text = pickedImage.path;
      });
    }
  }

  // Validates form, constructs FigurineModel, and returns it to previous screen
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

      Navigator.pop(
        context,
        createdFigurine,
      ); // Passes result back to home screen
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
              if (imageFile != null) Image.file(imageFile!, height: 160),

              // Camera icon to take a photo
              IconButton(
                icon: const Icon(Icons.camera_alt),
                color: Colors.white,
                iconSize: 32,
                onPressed: takePhoto,
              ),
              const SizedBox(height: 20),

              // Text field for figurine name
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

              // Text field for figurine note/description
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

              const SizedBox(height: 24),

              // Submit button
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