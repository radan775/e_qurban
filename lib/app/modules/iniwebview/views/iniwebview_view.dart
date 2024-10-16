import 'package:e_qurban/app/modules/iniwebview/controllers/iniwebview_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../components/card_article.dart';

class IniWebViewView extends GetView<IniWebViewController> {
  const IniWebViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('webview'),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            // Display a progress indicator while loading
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary),
              ),
            );
          } else {
            // Display the list of articles
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.articles.length,
              itemBuilder: (context, index) {
                var article = controller.articles[index];
                return CardArticle(article: article);
              },
            );
          }
        }));
  }
}
