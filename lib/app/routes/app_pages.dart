import 'package:e_qurban/app/modules/iniwebview/bindings/iniwebview_binding.dart';
import 'package:e_qurban/app/modules/iniwebview/views/ini_tampilan_web.dart';
import 'package:e_qurban/app/modules/iniwebview/views/iniwebview_view.dart';
import 'package:e_qurban/app/modules/login/bindings/login_binding.dart';
import 'package:e_qurban/app/modules/login/views/login_views.dart';
import 'package:e_qurban/app/modules/product_detail/bindings/product_detail_binding.dart';
import 'package:e_qurban/app/modules/product_detail/views/product_detail_view.dart';
import 'package:e_qurban/app/modules/register/bindings/register_binding.dart';
import 'package:e_qurban/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: _Paths.REGISTER,
        page: () => const RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: _Paths.INI_WEBVIEW,
        page: () => const IniWebViewView(),
        binding: IniwebviewBinding()),
    GetPage(
        name: _Paths.INI_TAMPILAN_WEB,
        page: () => IniTampilanWeb(article: Get.arguments),
        binding: IniwebviewBinding()),
    GetPage(
        name: _Paths.DETAIL_PRODUCT,
        page: () => ProductDetailView(product: Get.arguments),
        binding: ProductDetailBinding())
  ];
}
