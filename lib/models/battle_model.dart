class BattleModel {
  final String battleId;
  final String combatant1;
  final String combatant2;
  final String winner;
  final DateTime battleDate;

  BattleModel({
    required this.battleId,
    required this.combatant1,
    required this.combatant2,
    required this.winner,
    required this.battleDate,
  });
}
