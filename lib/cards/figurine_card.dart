import 'package:flutter/material.dart';
import 'package:my_figurines/models/figurine_model.dart';

class FigurineCard extends StatelessWidget {
  final FigurineModel figurine;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

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
            CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(figurine.imageUrl),
              backgroundColor: Colors.blueGrey,
            ),

            const SizedBox(width: 20),

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
                ],
              ),
            ),
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
