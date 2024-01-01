import 'package:quotes_db_miner_pr/Models/quote_database_model.dart';

class GetQuotesMethod {
  Future<List<QuotesDatabaseModel>> getAllQuotes;

  GetQuotesMethod({
    required this.getAllQuotes,
  });
}
