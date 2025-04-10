import 'dart:async';
import 'dart:math'; // For random number generation
import 'package:flutter/material.dart';
import 'package:my_figurines/models/battle_model.dart';
import 'package:my_figurines/models/figurine_model.dart';

class BattleScreen extends StatefulWidget {
  final List<FigurineModel> figurines;

  const BattleScreen({super.key, required this.figurines});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  FigurineModel? combatant1;
  FigurineModel? combatant2;
  final List<BattleModel> battleLog = [];
  final List<String> displayList = [];
  bool isFighting = false;

  void startFight() {
    if (combatant1 == null || combatant2 == null || combatant1 == combatant2) {
      setState(() {
        displayList.add("! -- Select 2 different combatants to fight -- !");
      });
      return;
    }

    int healthOne = combatant1!.health;
    int healthTwo = combatant2!.health;

    setState(() {
      isFighting = true;
    });

    fightTurn(healthOne, healthTwo);
  }

  void fightTurn(int healthOne, int healthTwo) async {
    while (healthOne > 0 && healthTwo > 0) {
      int damage1 = combatant1!.damage + (Random().nextInt(11) - 5);
      int block1 = combatant1!.block + (Random().nextInt(7) - 3);
      damage1 = damage1.clamp(1, combatant1!.damage);
      block1 = block1.clamp(0, combatant1!.block);

      int attackDamage1 = (damage1 - block1).clamp(0, 999);
      healthTwo -= attackDamage1;

      setState(() {
        displayList.add(
          "${combatant1!.name} attacks and deals $attackDamage1 damage (Blocked: $block1). ${combatant2!.name}'s Health: $healthTwo\n",
        );
      });

      if (healthTwo <= 0) break;

      await Future.delayed(Duration(seconds: 3));

      int damage2 = combatant2!.damage + (Random().nextInt(11) - 5);
      int block2 = combatant2!.block + (Random().nextInt(7) - 3);
      damage2 = damage2.clamp(1, combatant2!.damage);
      block2 = block2.clamp(0, combatant2!.block);

      int attackDamage2 = (damage2 - block2).clamp(0, 999);
      healthOne -= attackDamage2;

      setState(() {
        displayList.add(
          "${combatant2!.name} attacks and deals $attackDamage2 damage (Blocked: $block2). ${combatant1!.name}'s Health: $healthOne\n",
        );
      });

      if (healthOne <= 0) break;

      await Future.delayed(Duration(seconds: 3));
    }

    final winner = healthOne > 0 ? combatant1!.name : combatant2!.name;

    setState(() {
      displayList.add("\n$winner Wins!");
      battleLog.add(
        BattleModel(
          battleId: DateTime.now().microsecondsSinceEpoch.toString(),
          combatant1: combatant1!.name,
          combatant2: combatant2!.name,
          winner: winner,
          battleDate: DateTime.now(),
        ),
      );
      isFighting = false;
    });
  }

  void selectCombatant(Function(FigurineModel) onSelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      builder: (context) {
        return ListView(
          children:
              widget.figurines.map((f) {
                return ListTile(
                  title: Text(
                    f.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected(f);
                  },
                );
              }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        title: const Text("Figurine Battle"),
        backgroundColor: const Color.fromRGBO(29, 205, 159, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed:
                        () => selectCombatant(
                          (f) => setState(() => combatant1 = f),
                        ),
                    child: Text(
                      combatant1 == null ? "Combatant 1" : combatant1!.name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: ElevatedButton(
                    onPressed:
                        () => selectCombatant(
                          (f) => setState(() => combatant2 = f),
                        ),
                    child: Text(
                      combatant2 == null ? "Combatant 2" : combatant2!.name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isFighting ? null : startFight,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text("Fight!"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        displayList[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
