// import 'package:get/get.dart';
// import 'package:softminion/API%20Service%20Layer/api_services/all_products_list_api.dart';
// import 'package:softminion/System_Architecture/Controller/API_Controller/all_product_list_controller.dart';
// import 'package:softminion/System_Architecture/Model/all_class_model/all_products_list_model.dart';

// class ShopesMamaHomePageScreenModel {
//   RxList<AllProductsListModel> productCardItemList =
//       <AllProductsListModel>[].obs;

//   final ApiServiceAllProductsList apiService = ApiServiceAllProductsList();
//   final AllProductListController dataController = AllProductListController();

//   ShopesMamaHomePageScreenModel() {
//     fetchData();
//   }

//   void fetchData() async {
//     try {
//       List<AllProductsListModel> items = await apiService.fetchData();
//       productCardItemList.addAll(items);
//       for (var item in items) {
//         print('Name: ${item.name}');
//         print('Status: ${item.status}');
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }
// }
