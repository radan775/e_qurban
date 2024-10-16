import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  // Properti untuk mengontrol status love (apakah sudah ditekan atau belum)
  var isLoved = false.obs;

  // Properti untuk jumlah barang di keranjang
  var cartItemCount = 0.obs;
  // var cartsingleitem = 0.obs;
  // Fungsi untuk toggle status love
  void toggleLove() {
    isLoved.value = !isLoved.value;
  }

  // Fungsi untuk menambah barang ke keranjang
  void addToCart() {
    cartItemCount.value++;
    // if (car) {

    // }
    // cartItemCount = cartItemCount + cartsingleitem;
  }
}
