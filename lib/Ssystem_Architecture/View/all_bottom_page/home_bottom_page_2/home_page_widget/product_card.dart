import 'package:flutter/material.dart';
import 'package:softminion/Ssystem_Architecture/Model/all_class_model/all_products_list_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
    this.homeProductModel, {
    Key? key,
    this.isGrid = false,
  }) : super(key: key);

  final AllProductsListModel homeProductModel;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 50,
              spreadRadius: 7,
              color: const Color(0xFF4F4F4F).withOpacity(0.1),
              offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            width: 130,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Stack(
              children: [Center()],
            ),
          )
        ],
      ),
    );
  }
}
