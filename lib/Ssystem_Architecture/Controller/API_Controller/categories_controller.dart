import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/categories_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/categories_model.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  var categoryList = <CategoriesModelData>[].obs;
  final ApiServiceCategories apiService = ApiServiceCategories();
  var selectedCategories = Rx<CategoriesController?>(null);

  var selectedCategoryIndex = 0; // Track the selected index

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void selectCategoriesMethod(CategoriesController category) {
    selectedCategories.value = category;
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var data = await apiService.fetchData();

      if (data.isNotEmpty) {
        // Convert to list of CategoriesModelData
        var fetchedCategories = data.cast<CategoriesModelData>();

        // Find the "Featured" category and move it to the front if it exists
        CategoriesModelData? featuredCategory =
            fetchedCategories.firstWhereOrNull(
          (item) => item.name?.value == 'Featured',
        );

        // If the "Featured" category exists, remove it from its current position
        // and insert it at the first position
        if (featuredCategory != null) {
          fetchedCategories.remove(featuredCategory);
          fetchedCategories.insert(0, featuredCategory);
        }

        // Use assignAll to update the observable list with the reordered list

        categoryList.assignAll(fetchedCategories);
      } else {}
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading(false);
    }
  }
}
