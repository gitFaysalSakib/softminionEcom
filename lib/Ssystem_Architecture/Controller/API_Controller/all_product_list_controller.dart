import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/all_products_list_api.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/categories_controller.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/product_attributes_controller.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';

class AllProductListController extends GetxController {
  var isLoading = true.obs;
  var dataList = <AllProductsListModel>[].obs; // Strongly type the list
  var filteredProductsForFeatured =
      <AllProductsListModel>[].obs; // Observable filtered products list
  var filterClothProduct = <AllProductsListModel>[].obs;
  var filterGamesProduct = <AllProductsListModel>[].obs;

  final ApiServiceAllProductsList apiService = ApiServiceAllProductsList();
  final ProductAttributesController productAttributesController =
      Get.put(ProductAttributesController());
  final CategoriesController categoryController =
      Get.put(CategoriesController()); // Get CategoriesController
  RxBool isEvenForTwoRowDisplay = false.obs;
  RxBool isEvenForOneRowDisplay = false.obs;
  var isLoadingMore = false.obs;
  var searchText = ''.obs; // Add search text as observable

  var page = 1; // Current page
  var perPage = 12; // Items per page

  // New variables to store the selected category and attributes
  var selectedCategoryId = Rxn<int>();
  var selectedCategoryaName = Rxn<String>();

  var selectedAttributes = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    fetchDataFromApiServicePageSetDynamically().then((_) {
      fetchFeaturedCategoryProduct();
      clothCategoriesProductItemShow();
      gamesCategoriesProductItemShow();
    });
    //fetchDataFromApiServicePageSetDynamically();
  }

  // Fetch all product data from API
  // Future<void> fetchDataFromApiServicePageSetDefaultFisrt() async {
  //   try {
  //     isLoading(true);
  //     var data = await apiService.fetchData(page: page, perPage: perPage);
  //     if (data.isNotEmpty) {
  //       dataList.assignAll(data);
  //       print(dataList.length);
  //       dataList.forEach((product) {
  //         print(
  //             'Product Name: ${product.type.value.first.id}'); // Assuming 'name' is the property
  //       });
  //       print('Data fetched from API successfully.');
  //     } else {
  //       print("No data found.");
  //     }
  //   } catch (e) {
  //     print("Error fetching data: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }
  // Set selected category from UI
  void setSelectedCategory(int categoryId) {
    selectedCategoryId.value = categoryId;
  }

  void setSelectedCategoryName(String categoryName) {
    selectedCategoryaName.value = categoryName;
  }

  // Set selected attributes from UI
  void setSelectedAttributes(List<String> attributes) {
    selectedAttributes.assignAll(attributes);
  }

  //attributtes, category all filter search .....

  Future<void> fetchDataFromApiServiceWithAttributesAndOthers(
      {bool loadMore = false}) async {
    try {
      if (loadMore) {
        isLoadingMore(true);
      } else {
        isLoading(true);
        page = 1;
      }
      // var data = await apiService.fetchData(page: page, perPage: perPage);
      // Pass the search query to the API service
      var data = await apiService.fetchData(
        searchQuery: searchText.value,
        page: page,
        perPage: perPage,
        categoryId: selectedCategoryId.value,
        attributes: productAttributesController.selectedCheckBoxAttributeValues
            .toList(),
      );

      if (data.isNotEmpty) {
        if (loadMore) {
          dataList.addAll(data); // Append new data for pagination
        } else {
          dataList.assignAll(data); // First-time fetch
        }
        page++; // Increment page for next load
      } else {
        print("No more products.");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
      isLoadingMore(false);
    }
  }

  Future<void> fetchDataFromApiServicePageSetDynamically(
      {bool loadMore = false}) async {
    try {
      if (loadMore) {
        isLoadingMore(true);
      } else {
        isLoading(true);
        page = 1;
      }
      // var data = await apiService.fetchData(page: page, perPage: perPage);
      // Pass the search query to the API service
      var data = await apiService.fetchData(
        page: page,
        perPage: perPage,
        searchQuery: searchText.value, // Pass search query to the API
      );

      if (data.isNotEmpty) {
        if (loadMore) {
          dataList.addAll(data); // Append new data for pagination
        } else {
          dataList.assignAll(data); // First-time fetch
        }
        page++; // Increment page for next load
      } else {
        print("No more products.");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
      isLoadingMore(false);
    }
  }

  // Fetch only "Featured" category products
  void fetchFeaturedCategoryProduct() async {
    try {
      isLoading(true);

      if (categoryController.categoryList.isNotEmpty) {
        var featuredCategoryId = categoryController.categoryList.first.id.value;

        filteredProductsForFeatured.assignAll(dataList.where((product) {
          return product.type.any(
              (category) => category.id.value == featuredCategoryId.toString());
        }).toList());

        print(
            "frreeeeeeeeeeeeeeeeeeeeeeeeeeee: ${filteredProductsForFeatured.length}");

        if (filteredProductsForFeatured.isNotEmpty) {
          bool isEven = filteredProductsForFeatured.length % 2 == 0;
          isEvenForTwoRowDisplay.value = isEven;

          // if (isEven == true) {
          // } else {
          //   isEvenForRowDisplay.value = false;
          // }
          // Update reactive value

          print(isEvenForTwoRowDisplay.value
              ? "Even number of products"
              : "Odd number of products");
        } else {
          print("No products found for the 'Featured' category.");
        }
      } else {
        print("No categories found.");
      }
    } catch (e) {
      print("Error fetching featured category products: $e");
    } finally {
      isLoading(false);
    }
  }

  //fetch cloth Type product show as
  void clothCategoriesProductItemShow() async {
    try {
      isLoading(true);

      if (categoryController.categoryList.isNotEmpty) {
        var featuredCategoryName =
            categoryController.categoryList[1].name.value;
        print(featuredCategoryName);

        filterClothProduct.assignAll(dataList.where((product) {
          return product.type.any((category) =>
              category.categoryType.value == featuredCategoryName);
        }).toList());
        // isEvenForOneRowDisplay.value = false;

        for (var cloth in filterClothProduct) {
          print("Product Name: ${cloth.name}, Product ID: ${cloth.id}");
          // Add more product details if needed
        }
      } else {
        print("No categories found.");
      }
    } catch (e) {
      print("Error fetching featured category products: $e");
    } finally {
      isLoading(false);
    }
  }

//games category fetch....
  void gamesCategoriesProductItemShow() async {
    try {
      isLoading(true);

      if (categoryController.categoryList.isNotEmpty) {
        var featuredCategoryName =
            categoryController.categoryList[3].name.value;
        //  print(featuredCategoryName);

        filterGamesProduct.assignAll(dataList.where((product) {
          return product.type.any((category) =>
              category.categoryType.value == featuredCategoryName);
        }).toList());
        // isEvenForOneRowDisplay.value = false;

        for (var games in filterGamesProduct) {
          print(
              "Product Nameeeeeeeeeee: ${games.type.first.categoryType}, Product ID: ${games.id}");
          // Add more product details if needed
        }
      } else {
        print("No categories found.");
      }
    } catch (e) {
      print("Error fetching featured category products: $e");
    } finally {
      isLoading(false);
    }
  }
}
