import 'package:get/get.dart';

class AddressCategoryController extends GetxController {
  // Default selected category
  var selectedCategory = 'Home'.obs;

  // Method to update the selected category
  void updateCategory(String category) {
    selectedCategory.value = category;
  }
}
