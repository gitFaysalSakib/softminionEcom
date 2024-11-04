import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/bottom_buy_add_button_navigator/custom_bottom_button_navigator.dart';

class ProductDetailsPage extends StatelessWidget {
  final HomePageProductItemModel product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.item?.value ?? "Product Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image?.value ?? '',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${product.newPrice?.value ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.item?.value ?? 'No description',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () {
                // Handle Buy Now action
              },
              onAddToCart: () {
                // Handle Add to Cart action
              },
            ),
          ],
        ),
      ),
    );
  }
}
