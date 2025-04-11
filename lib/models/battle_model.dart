// Model class representing a recorded battle between two figurines
class BattleModel {
  // Unique ID for the battle
  final String battleId;

  // Name of the first combatant
  final String combatant1;

  // Name of the second combatant
  final String combatant2;

  // Name of the winning combatant
  final String winner;

  // Timestamp of when the battle occurred
  final DateTime battleDate;

  BattleModel({
    required this.battleId,
    required this.combatant1,
    required this.combatant2,
    required this.winner,
    required this.battleDate,
  });
}