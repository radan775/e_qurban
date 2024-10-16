import 'package:e_qurban/app/data/models/articles.dart';
import 'package:e_qurban/app/modules/iniwebview/controllers/iniwebview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class IniTampilanWeb extends GetView<IniWebViewController> {
  final Article article;

  const IniTampilanWeb({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("WebView"),
        ),
        body: WebViewWidget(
          controller: controller.webViewController(article.url),
        ));
  }
}
