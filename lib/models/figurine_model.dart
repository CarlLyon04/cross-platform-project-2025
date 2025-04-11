// Model class representing a figurine entity in the app
class FigurineModel {
  const FigurineModel({
    // Unique identifier for the figurine
    required this.id,

    // Name of the figurine
    required this.name,

    // Description or note about the figurine
    required this.note,

    // URL or path to the figurine's image
    required this.imageUrl,

    // Health points used during battles
    required this.health,

    // Base damage capability
    required this.damage,

    // Block/defense value
    required this.block,
    // Timestamp of when the figurine was created
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