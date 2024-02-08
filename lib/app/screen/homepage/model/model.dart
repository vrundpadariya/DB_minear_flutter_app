class QuoteModel {
  int id;
  String category;
  List quotes;

  QuoteModel({
    required this.category,
    required this.id,
    required this.quotes,
  });

  factory QuoteModel.fromJson({required Map data}) {
    return QuoteModel(
      category: data['category'],
      id: data['id'],
      quotes: data['quotes'],
    );
  }
}
