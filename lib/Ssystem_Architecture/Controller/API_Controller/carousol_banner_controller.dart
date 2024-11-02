import 'dart:async';
import 'package:get/get.dart';

class CarouselBannerController extends GetxController {
  var currentIndex = 0.obs;
  Timer? _autoPlayTimer;
  int totalPages = 0; // Total pages to be set from the widget

  @override
  void onClose() {
    _autoPlayTimer?.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void startAutoPlay(Function animateToNextPage) {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (totalPages > 0) {
        animateToNextPage();
      }
    });
  }

  void setTotalPages(int count) {
    totalPages = count;
  }
}
