import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/all_products_list_api.dart';
import 'package:softminion/API%20Service/api_services/product_attributes_api.dart';
import 'package:softminion/API%20Service/api_services/single_attributes_value_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/product_attributes.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/single_attributes_value_model.dart';

class ProductAttributesController extends GetxController {
  var isLoading = true.obs; // Loading state
  var attributesList = <ProductAttributesModel>[].obs;
  Map<String, List<SingleAttributesValueModel>> attributeValuesListFetch =
      {}; // Key: attribute ID, Value: list of attribute values

  final ApiProductAttributes apiService =
      ApiProductAttributes(); // Instance of the API service
  final ApiSingleAttributesValue apiSingleAttributesValue =
      ApiSingleAttributesValue(); // Instance of the API service
  var selectedCheckBoxAttributeValues =
      <String>{}.obs; // Observable set to track selected values

  @override
  void onInit() {
    fetchProductAttributes(); // Fetch data when the controller is initialized
    fetchSingleAttributesValue(); // Fetch data when the controller is initialized

    super.onInit();
  }

  void fetchProductAttributes() async {
    try {
      isLoading(true); // Set loading state to true
      var data = await apiService.fetchData(); // Fetch data from the API

      if (data.isNotEmpty) {
        attributesList.assignAll(
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

  void fetchSingleAttributesValue() async {
    try {
      isLoading(true); // Set loading state to true
      for (var attributeSingle in attributesList) {
        if (attributeSingle.id != null) {
          print(attributeSingle.id);
          print(attributeValuesListFetch.length);
          final valuesResponse = await apiSingleAttributesValue
              .fetchData(attributeSingle.id!); // Endpoint 2
          attributeValuesListFetch[attributeSingle.id.toString()] =
              valuesResponse
                  .map((data) => SingleAttributesValueModel(name: data.name))
                  .toList();
        }
      }
    } catch (e) {
      print(
          "Error fetching product attributes: $e"); // Print any errors that occur
    } finally {
      isLoading(false); // Set loading state to false
    }
  }
}
