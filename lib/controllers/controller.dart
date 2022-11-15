import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var dummy = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';'],
    ['z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/'],
  ];

  var list = [[]].obs;
  var data = [[]];
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    data = dummy;
  }

  intialData() {
    list.value = data;
  }

  horizontalFLip() {
    isLoading.value = true;
    for (int y = 0; y < 4; y++) {
      var x2 = 9;
      for (int x = 0; x < 5; x++) {
        if (kDebugMode) {
          print('${data[y][x]} = ${data[y][x2]}');
        }
        var cache = data[y][x];
        data[y][x] = data[y][x2];
        data[y][x2] = cache;
        if (kDebugMode) {
          print('${data[y][x]} = ${data[y][x2]}');
        }
        x2--;
      }
    }
    isLoading.value = false;
    list.value = data;
  }

  verticalFLip() {
    isLoading.value = true;
    for (int y = 0; y < 2; y++) {
      var y2 = 3;
      if (kDebugMode) {
        print('${data[y]} = ${data[y2]}');
      }
      var cache = data[y];
      data[y] = data[y2];
      data[y2] = cache;
      if (kDebugMode) {
        print('${data[y]} = ${data[y2]}');
      }
    }
    isLoading.value = false;
    list.value = data;
  }
}
