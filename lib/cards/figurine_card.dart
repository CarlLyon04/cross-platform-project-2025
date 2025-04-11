import 'package:flutter/material.dart';
import 'package:my_figurines/models/figurine_model.dart';
import 'dart:io';

// A custom UI card to display a figurine's details in a styled format
class FigurineCard extends StatelessWidget {
  final FigurineModel figurine; // The figurine to display
  final VoidCallback? onTap; // Optional tap handler (not used here)
  final VoidCallback? onDelete; // Optional delete handler

  const FigurineCard({
    super.key,
    required this.figurine,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(22, 153, 118, 1),
              Color.fromRGBO(29, 205, 159, 1),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display image as local file or network image
            CircleAvatar(
              radius: 36,
              backgroundImage:
                  figurine.imageUrl.startsWith('/')
                      ? FileImage(File(figurine.imageUrl))
                      : NetworkImage(figurine.imageUrl) as ImageProvider,
              backgroundColor: Colors.blueGrey,
            ),

            const SizedBox(width: 20),

            // Display figurine details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    figurine.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    figurine.note,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Health: ${figurine.health} | Damage: ${figurine.damage} | Block: ${figurine.block}",
                    style: const TextStyle(fontSize: 10, color: Colors.red),
                  ),
                ],
              ),
            ),

            // Delete icon to remove figurine
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ],
        ),
      ),
    );
  }
}