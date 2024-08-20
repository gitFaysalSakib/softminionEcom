// import 'package:flutter/material.dart';
// import 'package:softminion/Core/utils/size_utils.dart';
// import 'package:softminion/widgets/custom_bottom_button_navigator.dart';
// import 'package:softminion/widgets/custom_button_field.dart';
// import 'package:softminion/widgets/custom_image_view.dart';

// class ProductDetailsPage extends StatelessWidget {
//   const ProductDetailsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Watch"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             Center(
//               child: CustomImageView(
//                 imagePath: "assets/images/n2.png",
//                 height: 300,
//                 width: double.infinity,
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Product Price
//             Text(
//               '\$200',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),

//             // Product Short Description
//             Text(
//               "hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             const Spacer(),

//             // Use the ProductActionButtonBar here
//             ProductActionButtonBar(
//               onBuyNow: () {
//                 // Handle Buy Now
//               },
//               onAddToCart: () {
//                 // Handle Add to Cart
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
/////////////////
///new code.....
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Model/home_page_productItemmodel.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';

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
                // Handle Buy Now
              },
              onAddToCart: () {
                // Handle Add to Cart
              },
            ),
          ],
        ),
      ),
    );
  }
}
