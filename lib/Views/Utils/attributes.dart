import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../Models/quote_database_model.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();
final data = GetStorage();

Future<List<QuotesDatabaseModel>>? getAllQuotes;
