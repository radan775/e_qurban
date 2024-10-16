import 'dart:convert';

import 'package:e_qurban/app/data/models/cows.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Product> products = RxList<Product>([]);
  RxBool isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    await fetchCows();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchCows() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('http://147.185.221.20:26319'));

      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = Cows.fromJson(json.decode(jsonData));
        products.value = articlesResult.products;
        print("oke");
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred :$e');
    } finally {
      isLoading.value = false;
    }
  }
}
