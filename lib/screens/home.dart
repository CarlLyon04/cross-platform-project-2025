import 'package:flutter/material.dart';
import 'package:my_figurines/cards/figurine_card.dart';
import 'package:my_figurines/models/figurine_model.dart';
import 'package:my_figurines/screens/battle_screen.dart';
import 'package:my_figurines/screens/create_figurine.dart';

// Main home screen displaying all created figurines
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<FigurineModel> figurines = []; // Holds all user-created figurines

  // Navigates to the Create Figurine screen and adds the result to the list
  void redirectToCreateForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateFigurine()),
    );

    if (result != null && result is FigurineModel) {
      setState(() {
        figurines.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(29, 205, 159, 1),
        title: const Text(
          "My Figurines: Battle Game",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // Display message if no figurines, otherwise build a scrollable list
      body:
          figurines.isEmpty
              ? const Center(
                child: Text(
                  "No figures to display yet",
                  style: TextStyle(color: Colors.white),
                ),
              )
              : ListView.builder(
                itemCount: figurines.length,
                itemBuilder: (context, index) {
                  final figurine = figurines[index];
                  return FigurineCard(
                    figurine: figurine,
                    onDelete: () {
                      setState(() {
                        figurines.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${figurine.name} deleted")),
                      );
                    },
                  );
                },
              ),

      // Floating action buttons: Add Figurine and Start Battle
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Fight",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BattleScreen(figurines: figurines),
                ),
              );
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.sports_martial_arts),
          ),
          const SizedBox(height: 18),
          FloatingActionButton(
            heroTag: "Add",
            onPressed: redirectToCreateForm,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}