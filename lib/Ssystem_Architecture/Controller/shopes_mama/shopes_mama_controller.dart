import 'package:get/get.dart';
import 'package:softminion/API%20Service/shopesmama_api.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  var dataList = [].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchDataFromApiSerice();
    super.onInit();
  }

  void fetchDataFromApiSerice() async {
    try {
      isLoading(true);
      var data = await apiService.fetchData();
      print(data);
      if (data != null) {
        dataList.assignAll(data);
      }
    } finally {
      isLoading(false);
    }
  }
}
