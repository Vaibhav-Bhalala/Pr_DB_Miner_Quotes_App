import 'package:get/get.dart';

class TitleController extends GetxController {
  final RxString categoryName = ''.obs;

  void setCategoryName(String name) {
    categoryName.value = name;
  }
}
