import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/all_product_list_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';

class SingleOrMultipleAttributesCheckForDirectAddToCartOrNot
    extends GetxController {
  final AllProductListController allProductadataController = Get.find();

  var zeroIndexOptionsValue = <String>[].obs;
  var firstIndexOptionsValue = <String>[].obs;

  @override
  void onReady() {
    super.onReady();
    // Initialize or fetch data here if needed after the widget is ready
  }

  // Fetch and set options in a single method to avoid modifying state during build
  void initializeOptions(AllProductsListModel productModel) {
    zeroIndexOptionsValue.value = productModel.attributes
        .map((attribute) =>
            attribute.options.isNotEmpty ? attribute.options.first : null)
        .where((option) => option != null)
        .cast<String>()
        .toList();

    firstIndexOptionsValue.value = productModel.attributes
        .map((attribute) =>
            attribute.options.length > 1 ? attribute.options[1] : null)
        .where((option) => option != null)
        .cast<String>()
        .toList();
  }
}
