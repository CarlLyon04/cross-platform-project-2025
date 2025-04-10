import 'package:flutter/material.dart';
import 'package:my_figurines/cards/figurine_card.dart';
import 'package:my_figurines/models/figurine_model.dart';
import 'package:my_figurines/screens/create_figurine.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<FigurineModel> figurines = [];

  void redirectToCreateForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateFigurine()
      ),
    );

    if(result != null && result is FigurineModel) {
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
        title: const Text ("My Figurines", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: figurines.isEmpty ? const Center(
        child: Text(
           "No figures to display yet",
            style: TextStyle(color: Colors.white),
        ),
      )
      : ListView.builder(itemCount: figurines.length, itemBuilder: (context, index) {
        final figurine = figurines[index];
        return FigurineCard(
          figurine: figurine,
          onDelete: () {
            setState(() {
              figurines.removeAt(index);
            });

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${figurine.name} deleted")),
            );
          },
        );
      },
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: redirectToCreateForm,
      child: const Icon(Icons.add),
      backgroundColor: const Color.fromRGBO(123, 201, 255, 1),
      ),
    );
  }
}