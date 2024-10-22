import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/product_attributes_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/product_attributes.dart';

class ProductAttributesController extends GetxController {
  var isLoading = true.obs; // Loading state
  var productAttributesList =
      <ProductAttributesModel>[].obs; // Observable list to hold fetched data

  final ApiProductAttributes apiService =
      ApiProductAttributes(); // Instance of the API service

  @override
  void onInit() {
    fetchProductAttributes(); // Fetch data when the controller is initialized
    super.onInit();
  }

  void fetchProductAttributes() async {
    try {
      isLoading(true); // Set loading state to true
      var data = await apiService.fetchData(); // Fetch data from the API

      if (data.isNotEmpty) {
        productAttributesList.assignAll(
            data); // Update the observable list with the fetched data
      } else {
        print("No data found");
      }
    } catch (e) {
      print(
          "Error fetching product attributes: $e"); // Print any errors that occur
    } finally {
      isLoading(false); // Set loading state to false
    }
  }
}
