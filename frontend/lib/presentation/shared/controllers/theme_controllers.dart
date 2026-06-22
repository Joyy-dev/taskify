import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskify/core/theme/app_theme.dart';

class ThemeControllers extends GetxController{
  final box = GetStorage();
  var isdarkmode = false.obs;

  @override
  void onInit() {
    isdarkmode.value = box.read('darkMode') ?? false;

    Get.changeTheme(
      isdarkmode.value ? AppTheme.darkMode : AppTheme.lightMode
    );
    super.onInit();
  }

  void toggleTheme () {
    isdarkmode.value = !isdarkmode.value;
    box.write('darkMode', isdarkmode.value);

    Get.changeTheme(
      isdarkmode.value ? AppTheme.lightMode : AppTheme.darkMode
    );
  }
}