import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/payment_method_controller.dart';
import 'package:softminion/Ssystem_Architecture/View/order_confirm/order_cofirm_screen.dart';
import 'package:softminion/Ssystem_Architecture/View/payment_method_screen/payment_method_design_widget.dart';

class SelectPaymentMethodPage extends StatelessWidget {
  final PaymentMethodController controller = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            final paymentMethod = controller.dataList[index];
            return PaymentOptionWidget(
              title: paymentMethod.title ?? 'Unknown',
              onSelect: () {
                controller.selectPaymentMethod(paymentMethod.id ?? '');
                Get.to(
                    OrderConfirmScreen()); // Navigate to InvoicePage on select
              },
              shippingAddress: '',
            );
          },
        );
      }),
    );
  }
}
