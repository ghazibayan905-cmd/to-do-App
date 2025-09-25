import 'package:get/get.dart';
import 'package:testt/ui/view/home/home.dart';

class SplashScreenController extends GetxController{
   void onInit() {
    super.onInit();
    // انتظر 5 ثواني وروح عالهوم
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => Home());
    });
  }
}