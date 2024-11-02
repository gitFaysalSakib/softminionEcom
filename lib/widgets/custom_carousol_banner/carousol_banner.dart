import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softminion/Ssystem_Architecture/Controller/API_Controller/carousol_banner_controller.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> images;
  final double height;
  final bool autoPlay;

  CustomCarouselSlider({
    Key? key,
    required this.images,
    this.height = 200.0,
    this.autoPlay = true,
  }) : super(key: key);

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselBannerController carouselController =
      Get.put(CarouselBannerController());
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Local PageController
    carouselController.setTotalPages(widget.images.length);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.autoPlay) {
        carouselController.startAutoPlay(_animateToNextPage);
      }
    });
  }

  void _animateToNextPage() {
    if (_pageController.hasClients) {
      // Check if the controller is attached
      int nextIndex =
          (carouselController.currentIndex.value + 1) % widget.images.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: carouselController.onPageChanged,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: carouselController.currentIndex.value == index
                      ? 12.0
                      : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: carouselController.currentIndex.value == index
                        ? Colors.blue
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            )),
      ],
    );
  }
}
