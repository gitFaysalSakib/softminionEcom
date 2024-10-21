import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/payment_method_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/payment_method_model.dart';

class PaymentMethodController extends GetxController {
  var isLoading = true.obs;
  var dataList = <PaymentMethodModel>[].obs;
  var selectedMethodId = ''.obs; // Track selected payment method
  final ApiServicePaymentMethod apiService = ApiServicePaymentMethod();

  @override
  void onInit() {
    fetchDataFromApiService();
    super.onInit();
  }

  void fetchDataFromApiService() async {
    try {
      isLoading(true);
      var data = await apiService.fetchData();
      if (data.isNotEmpty) {
        dataList.assignAll(data.cast<PaymentMethodModel>());
        // Set the first method as default or set a default ID
        selectedMethodId.value = dataList.first.id ?? '';
      } else {
        print("No data found.");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }

  void selectPaymentMethod(String methodId) {
    selectedMethodId.value = methodId; // Update the selected method ID
    // This triggers UI to refresh instantly
  }
}
