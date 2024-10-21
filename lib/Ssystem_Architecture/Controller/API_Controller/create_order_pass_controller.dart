import 'package:get/get.dart';
import 'package:softminion/API%20Service/api_services/create_order_api.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/create_order_model.dart';
import 'package:softminion/Token_Manage/token_store.dart';
import 'package:softminion/card_all/add_to_cart_controller.dart';

class CreateOrderPassController extends GetxController {
  final CartController cartController = Get.find<CartController>();
  final ApiServiceCreateOrder _apiServiceCreateOder = ApiServiceCreateOrder();
  final TokenService tokenService = Get.find<TokenService>();

  var orderList = <CreateOrderModel>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();

    String? userIdString = tokenService.userId.value;

    try {
      if (userIdString != null && userIdString.isNotEmpty) {
        int userIdInt = int.parse(userIdString);

        fetchOrders(userIdInt);
      } else {
        print("Error: userIdString is either null or empty");
      }
    } catch (e) {
      print("Error parsing userIdString: $e");
    }
  }

  Future<void> createOrder() async {
    String userIdString = tokenService.userId.value;

    int userIdInt = 0;
    if (userIdString.isNotEmpty && int.tryParse(userIdString) != null) {
      userIdInt = int.parse(userIdString);
      // Now you can safely use userIdInt
    } else {
      // Handle the error case where userIdString is not a valid integer
      print('Invalid userId string: $userIdString');
    }

    //qprint(userIdInt);
    // Get only the selected items
    var selectedItems = cartController.cartItems
        .where((item) => item.isSelected == true)
        .toList();
    print("......new");
    print(selectedItems.length);
    print("......new.....");
    if (selectedItems.isNotEmpty) {
      CreateOrderModel createOrderModel = CreateOrderModel(
        customerId: userIdInt,
        status: "pending",
        currency: 'BDT',
        lineItems: selectedItems.map((cartItem) {
          return LineItems(
            productId: int.parse(cartItem.productID),
            quantity: cartItem.quantity,
            price: cartItem.total.toInt(),
            variationId:
                cartItem.variationID != null && cartItem.variationID.isNotEmpty
                    ? int.parse(cartItem.variationID)
                    : null, // If no variation ID, it will be null
          );
        }).toList(),
      );
      await _apiServiceCreateOder.createOrderByPostMethod(createOrderModel);
      // After successful order creation, remove the selected items from the cart
      selectedItems.forEach((item) {
        cartController.cartItems.remove(item);
      });
      cartController.saveCartToLocalStorage();

      print("Order created and selected items removed from cart.");
    }
  }

//fetch user orders info...
  Future<void> fetchOrders(int customerId) async {
    try {
      isLoading.value = true;
      var orders =
          await _apiServiceCreateOder.fetchSpecificUserOrders(customerId);
      if (orders.isNotEmpty) {
        orderList.assignAll(orders.cast<CreateOrderModel>());
      } else {
        orderList.clear();
      }
    } catch (e) {
      print('Error fetching orders: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
