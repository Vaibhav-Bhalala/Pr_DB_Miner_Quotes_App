import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Models/json_model.dart';
import '../Models/quotes_model.dart';

class LocalJsonController extends GetxController {
  LocalJsonModel localJsonModel = LocalJsonModel(jsonData: "", Quotes: []);

  LocalJsonDataLoad() async {
    String JsonPath = "assets/json/quotes.json";
    localJsonModel.jsonData = await rootBundle.loadString(JsonPath);

    List decodedList = jsonDecode(localJsonModel.jsonData);

    localJsonModel.Quotes =
        decodedList.map((e) => QuotesModel.fromJson(e)).toList();

    update();
  }
}
