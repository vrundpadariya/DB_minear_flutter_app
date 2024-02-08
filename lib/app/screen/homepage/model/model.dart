class QuoteModel {
  int id;
  String category;
  String color;
  List quotes;

  QuoteModel({
    required this.category,
    required this.id,
    required this.quotes,
    required this.color,
  });

  factory QuoteModel.fromJson({required Map data}) {
    return QuoteModel(
      category: data['category'],
      id: data['id'],
      quotes: data['quotes'],
      color: data['color'],
    );
  }
}
