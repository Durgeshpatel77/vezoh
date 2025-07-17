import 'package:get/get.dart';

class GetStartedController extends GetxController {
  var code = ''.obs;

  bool get isCodeValid => code.value.length == 6;
}
