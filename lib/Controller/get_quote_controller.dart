import 'package:get/get.dart';
import '../Models/getquote_method.dart';
import '../Models/quote_database_model.dart';

class GetQuotesController extends GetxController {
  GetQuotesMethod getQuotesMethod =
      GetQuotesMethod(getAllQuotes: Future(() => []));

  getQuotesList({required Future<List<QuotesDatabaseModel>> allQuotes}) {
    getQuotesMethod.getAllQuotes = allQuotes;
    update();
  }
}
