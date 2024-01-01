import 'package:quotes_db_miner_pr/Models/quotes_model.dart';

class LocalJsonModel {
  String jsonData;
  List<QuotesModel> Quotes;

  LocalJsonModel({
    required this.jsonData,
    required this.Quotes,
  });
}
