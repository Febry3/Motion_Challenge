import 'package:get/get.dart';

class NavbarController extends GetxController {
  int tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
