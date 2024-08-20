import 'package:flutter/material.dart';
import 'package:softminion/Core/utils/size_utils.dart';
import 'package:softminion/widgets/custom_bottom_button_navigator.dart';

class CustomLargeBottomSheetContent extends StatefulWidget {
  @override
  _CustomLargeBottomSheetContentState createState() =>
      _CustomLargeBottomSheetContentState();
}

class _CustomLargeBottomSheetContentState
    extends State<CustomLargeBottomSheetContent> {
  final List<Map<String, String>> colorItems = [
    {'image': 'assets/images/s1.jpg', 'name': 'Red'},
    {'image': 'assets/images/s2.jpg', 'name': 'Yellow'},
    {'image': 'assets/images/s3.jpg', 'name': 'Blue'},
    {'image': 'assets/images/s4.jpg', 'name': 'Pink'},
    {'image': 'assets/images/s5.jpg', 'name': 'Green'},
    {'image': 'assets/images/s6.jpg', 'name': 'Black'},
    {'image': 'assets/images/s7.jpg', 'name': 'Orange'},
    {'image': 'assets/images/s8.jpg', 'name': 'Purple'},
  ];

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  String selectedColor = 'Red';
  String selectedSize = 'M'; // Initialize with a default size
  int quantity = 1; // Initialize with a default quantity
  String selectedImage = 'assets/images/s1.jpg'; // Default image

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
          // Top Row for Image, Selected Size, and Selected Color Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h, top: 8.h),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.all(8.h), // Set padding around the image
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)), // Adjust the radius for a slight curve
                        child: Image.asset(
                          selectedImage, // Use the selected image here
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
          // Color Family Images with Color Names
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
                      selectedImage = colorItems[index]
                          ['image']!; // Update the selected image
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
          // Size Selection Row
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
                      color: isSelected
                          ? Colors.blue[100]
                          : Colors.grey[200], // Highlight selected size
                      borderRadius: BorderRadius.circular(8.h),
                      border: isSelected
                          ? Border.all(color: Colors.blue, width: 2.h)
                          : null, // Border for selected size
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
          // Quantity Selection Row
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
          Spacer(), // Pushes the buttons to the bottom
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
    );
  }
}

// Usage
void showCustomLargeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => CustomLargeBottomSheetContent(),
  );
}
