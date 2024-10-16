import 'dart:convert';
import 'package:e_qurban/app/data/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IniWebViewController extends GetxController {
  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('http://147.185.221.23:24045'));

      if (response.statusCode == 200) {
        final jsonData = response.body;
        final articlesResult = Articles.fromJson(json.decode(jsonData));
        articles.value = articlesResult.articles;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred :$e');
    } finally {
      isLoading.value = false;
    }
  }

  WebViewController webViewController(String uri) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(uri));
  }
}
