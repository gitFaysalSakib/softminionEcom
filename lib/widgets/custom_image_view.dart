import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius? radius;
  final bool isNetwork; // To differentiate between asset and network images

  const CustomImageView({
    Key? key,
    required this.imagePath,
    this.height,
    this.radius,
    this.width,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.isNetwork =
        false, // Default to false, assuming the image is from assets
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: isNetwork
          ? Image.network(
              imagePath,
              height: height,
              width: width,
              fit: fit,
              alignment: alignment,
              errorBuilder: (context, error, stackTrace) {
                // Optionally, handle error loading image
                return Icon(Icons.error);
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
            )
          : Image.asset(
              imagePath,
              height: height,
              width: width,
              fit: fit,
              alignment: alignment,
            ),
    );
  }
}

// Modified ProductImageCarousel incorporating CustomImageView attributes

class ProductImageGalleryORSingleImage extends StatelessWidget {
  final List<String> imageUrls;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius? radius;
  final bool isNetwork;

  const ProductImageGalleryORSingleImage({
    Key? key,
    required this.imageUrls,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.radius,
    this.isNetwork = true, // Assuming these are network images by default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 250, // Default height if not provided
      width: width ?? double.infinity,
      child: imageUrls.isEmpty
          ? _buildPlaceholderImage()
          : imageUrls.length == 1
              ? _buildSingleImageView()
              : _buildImageCarouselView(),
    );
  }

  // Build a single image view
  Widget _buildSingleImageView() {
    return CustomImageView(
      imagePath: imageUrls[0],
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
      radius: radius,
      isNetwork: isNetwork,
    );
  }

  // Build placeholder image if no images are available
  Widget _buildPlaceholderImage() {
    return CustomImageView(
      imagePath: 'assets/images/placeholder.png', // Placeholder asset path
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
      radius: radius,
      isNetwork: false, // Placeholder will be from assets
    );
  }

  // Build a carousel for multiple images
  Widget _buildImageCarouselView() {
    return PageView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return CustomImageView(
          imagePath: imageUrls[index],
          height: height,
          width: width,
          fit: fit,
          alignment: alignment,
          radius: radius,
          isNetwork: isNetwork,
        );
      },
    );
  }
}
