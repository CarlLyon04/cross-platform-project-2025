class FigurineModel {
  const FigurineModel({
    required this.id,

    required this.name,

    required this.note,

    required this.imageUrl,

    required this.health,

    required this.damage,

    required this.block,

    required this.timeAdded,
  });

  final int id;

  final String name;

  final String note;

  final String imageUrl;

  final int health;

  final int damage;

  final int block;

  final DateTime timeAdded;
}
