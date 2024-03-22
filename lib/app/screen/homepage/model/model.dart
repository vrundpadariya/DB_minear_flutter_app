class QuoteModel {
  int id;
  String category;
  String color;
  List quotes;
  String image;

  QuoteModel({
    required this.category,
    required this.id,
    required this.quotes,
    required this.color,
    required this.image,
  });

  factory QuoteModel.fromJson({required Map data}) {
    return QuoteModel(
        category: data['category'],
        id: data['id'],
        quotes: data['quotes'],
        color: data['color'],
        image: data['image']);
  }
  // factory QuoteModel.fromDb({required Map data}) {
  //   return QuoteModel(
  //       category: data['category'],
  //       id: data['id'],
  //       quotes: data['quotes'],
  //       color: data['color']);
  // }
}
