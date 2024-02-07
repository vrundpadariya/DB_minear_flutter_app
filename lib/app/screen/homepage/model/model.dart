
class QuotesModel{
  int id;
  String category;
  List quotes;

  QuotesModel({required this.category, required this.quotes, required this.id})

  factory QuotesModel.fromjs({required Map data})=> QuotesModel(category: data['category'], quotes: data['quotes'], id: data['id']);
}

class qoutes{
  int id;
  String quote;
  String author;
  int favorite;

  qoutes({required this.author,required this.favorite, required this.quote, required this.id})

  factory qoutes.fromjs({required Map data}){
    return qoutes(author: data['author'], favorite: data['favorite'], quote: data['quote'], id: data['id'],);
  }


}
