import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/buy_add_button_test.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';

class CustomLargeBottomSheetContent extends StatefulWidget {
  final bool showOnlyBuyButton;
  final bool showOnlyAddToCartButton;
  final String? lastClickedButton;

  CustomLargeBottomSheetContent({
    this.showOnlyBuyButton = false,
    this.showOnlyAddToCartButton = false,
    this.lastClickedButton = "",
  });

  @override
  _CustomLargeBottomSheetContentState createState() =>
      _CustomLargeBottomSheetContentState();
}

class _CustomLargeBottomSheetContentState
    extends State<CustomLargeBottomSheetContent> {
  final List<Map<String, String>> colorItems = [
    {'image': 'assets/images/r.jpg', 'name': 'Red'},
    {'image': 'assets/images/y.jpg', 'name': 'Yellow'},
    {'image': 'assets/images/bluepng.png', 'name': 'Blue'},
    {'image': 'assets/images/p.jpg', 'name': 'Pink'},
    {'image': 'assets/images/g.jpg', 'name': 'Green'},
    {'image': 'assets/images/bl.jpg', 'name': 'Black'},
    {'image': 'assets/images/o.jpg', 'name': 'Orange'},
    {'image': 'assets/images/pu.jpg', 'name': 'Purple'},
  ];

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  String selectedColor = 'Red';
  String selectedSize = 'M';
  int quantity = 1;
  String selectedImage = 'assets/images/r.jpg';
  String productPrice = '\$29.99'; // Define the price of the product

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.height * 0.8,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.h),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h, top: 8.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          selectedImage,
                          height: 80.h,
                          width: 80.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productPrice, // Display the product price
                          style: TextStyle(
                            fontSize: 18.h, // Adjust font size as needed
                            fontWeight: FontWeight.bold,
                            color: Colors.red, // Adjust color as needed
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Color: $selectedColor",
                          style: TextStyle(
                            fontSize: 15.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Size: $selectedSize",
                          style: TextStyle(
                            fontSize: 15.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 24,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "Color Family",
            style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 200.h,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.h,
                mainAxisSpacing: 0.h,
                childAspectRatio: 2,
              ),
              itemCount: colorItems.length,
              itemBuilder: (context, index) {
                bool isSelected = colorItems[index]['name'] == selectedColor;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = colorItems[index]['name']!;
                      selectedImage = colorItems[index]['image']!;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.h),
                    margin: EdgeInsets.all(15.h),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.h),
                      border: isSelected
                          ? Border.all(color: Colors.blue, width: 2.h)
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          colorItems[index]['image']!,
                          height: 30.h,
                          width: 30.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 4.h),
                        Text(
                          colorItems[index]['name']!,
                          style: TextStyle(
                            fontSize: 10.h,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            "Size",
            style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: sizes.map((size) {
                bool isSelected = size == selectedSize;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.h),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.h),
                      border: isSelected
                          ? Border.all(color: Colors.blue, width: 2.h)
                          : null,
                    ),
                    child: Text(
                      size,
                      style: TextStyle(
                        fontSize: 10.h,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                "Quantity",
                style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
              Text(
                "$quantity",
                style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
          Spacer(),
          if (widget.lastClickedButton == "")
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () {},
              onAddToCart: () {
                Navigator.pop(context);
              },
              showBuyNow: true,
              showAddToCart: true,
            )
          else if (widget.showOnlyBuyButton)
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () => print("Buy now"),
              onAddToCart: () {},
              showBuyNow: true,
              showAddToCart: false,
            )
          else if (widget.showOnlyAddToCartButton)
            BuyandAddtoCartBottomButtonBar(
              onBuyNow: () {},
              onAddToCart: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added to cart successfully!'),
                  ),
                );
              },
              showBuyNow: false,
              showAddToCart: true,
            )
        ],
      ),
    );
  }
}

// void showCustomLargeBottomSheet(
//     BuildContext context, bool buy, bool add, String name) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (context) => CustomLargeBottomSheetContent(
//       showOnlyBuyButton: buy,
//       showOnlyAddToCartButton: add,
//       lastClickedButton: name,
//     ),
//   );
// }

void showCustomLargeBottomSheet(BuildContext context, bool buy, bool add,
    String name, VoidCallback onClose) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => CustomLargeBottomSheetContent(
      showOnlyBuyButton: buy,
      showOnlyAddToCartButton: add,
      lastClickedButton: name,
    ),
  ).whenComplete(onClose);
}
