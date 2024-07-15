import 'package:get/get.dart';

import '../Model/home_page_screen_model.dart';

/// A controller class for the MainPage.
///
/// This class manages the state of the MainPage, including the
/// current mainModelObj
class HomePageScrenController extends GetxController {
  HomePageScrenController(this.homepageModel);
  Rx<HomePageScreenModel> homepageModel;
}
