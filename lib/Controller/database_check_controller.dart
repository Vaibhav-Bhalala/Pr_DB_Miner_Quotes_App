import 'package:get/get.dart';
import '../Models/database_checker.dart';
import '../Views/Utils/attributes.dart';

class DataBaseCheckController extends GetxController {
  DataBaseCheckModel dataBaseCheckModel = DataBaseCheckModel(isInsert: false);

  InsertInValue() {
    dataBaseCheckModel.isInsert = true;

    data.write("isInsert", dataBaseCheckModel.isInsert);

    update();
  }
}
