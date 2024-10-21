// import 'package:get/get.dart';
// import 'package:softminion/API%20Service/shopesmama_api.dart';
// import 'package:softminion/Ssystem_Architecture/Model/shopes_mama_model.dart';

// class DataController extends GetxController {
//   var isLoading = true.obs;
//   var dataList = <ShopesMamaModel>[].obs; // Strongly type the list
//   final ApiService apiService = ApiService();

//   @override
//   void onInit() {
//     fetchDataFromApiService();
//     super.onInit();
//   }

//   void fetchDataFromApiService() async {
//     try {
//       isLoading(true);
//       var data = await apiService.fetchData();
//       if (data.isNotEmpty) {
//         dataList.assignAll(data.cast<ShopesMamaModel>());

//         dataList.forEach((item) {
//           print('Name: ${item.name.value}, Status: ${item.status.value}');

//           // Loop through images and print the image links
//           item.images.forEach((imageObj) {
//             if (imageObj.imageLink != null && imageObj.imageLink!.isNotEmpty) {
//               print('Image Link: ${imageObj.imageLink}');
//             } else {
//               print('No Image Link Found');
//             }
//           });
//           item.type.forEach((categoryObj) {
//             print('Category ID: ${categoryObj.categoryType}');
//           });
//         });
//       } else {
//         print("No data found.");
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
