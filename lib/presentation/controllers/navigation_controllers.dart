import 'package:get/get.dart';

class NavigationControllers extends GetxController{
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}