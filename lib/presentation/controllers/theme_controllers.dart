import 'package:get/get.dart';
import 'package:taskify/core/theme/app_theme.dart';

class ThemeControllers extends GetxController{
  var isdarkmode = false.obs;

  void toggleTheme () {
    isdarkmode.value = !isdarkmode.value;

    Get.changeTheme(
      isdarkmode.value ? AppTheme.lightMode : AppTheme.darkMode
    );
  }
}