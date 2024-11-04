import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/categories_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/categories_model.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  var categoryList = <CategoriesModelData>[].obs;
  final ApiServiceCategories apiService = ApiServiceCategories();
  var selectedCategories = Rx<CategoriesModelData?>(null);
  var selectedCategoryId = RxnInt(); // Use RxnInt to handle nullable int

  var selectedCategoryIndex = 0;
  var isCategorySelected =
      false.obs; // RxBool to track if any category is selected

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void selectCategoriesMethod(CategoriesModelData category) {
    selectedCategories.value = category;
  }

  // Method to check if a category is selected
  bool isSelectedPassId(int id) => selectedCategoryId.value == id;

  // Update selected category by ID
  void selectCategory(int id) {
    selectedCategoryId.value = id; // Update selected category ID()
    // print(selectedCategoryId);
    if (selectedCategoryId.value == id) {
      isCategorySelected.value =
          true; // Set to true when a category is selected
    }
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
