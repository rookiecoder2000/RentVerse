import 'package:get/get.dart';

class signUpController extends GetxController {
  double lineProgress(int index) {
    var _index = index;
    var _progressValue = 0.3;

    if (_index == 0) {
      _progressValue = 0.3;
    } else if (_index == 1) {
      _progressValue = 0.6;
    } else if (_index == 2) {
      _progressValue = 1.0;
    }
    return _progressValue;
  }
}
