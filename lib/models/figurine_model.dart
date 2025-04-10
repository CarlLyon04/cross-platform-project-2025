class FigurineModel {
  const FigurineModel({
    required this.id,

    required this.name,

    required this.note,

    required this.imageUrl,

    
    required this.timeAdded,
  });

  final int id;

  final String name;

  final String note;

  final String imageUrl;

  final DateTime timeAdded;
}