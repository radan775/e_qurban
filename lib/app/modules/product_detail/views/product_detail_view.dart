import 'package:e_qurban/app/data/models/cows.dart';
import 'package:e_qurban/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:e_qurban/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
        ),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: controller.isLoved.value ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  controller.toggleLove();
                },
              )),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          Obx(() => Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                  if (controller.cartItemCount.value > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          '${controller.cartItemCount.value}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar Produk Utama (Menggunakan Image.asset untuk gambar lokal)
                    Center(
                      child: Image.network(
                        'http://147.185.221.20:26319/${product.img}', // Gambar lokal yang baru dari komputer
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Thumbnail gambar kecil (Menggunakan gambar lokal yang sama)
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'http://147.185.221.20:26319/${product.img}',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Image.network(
                            'http://147.185.221.20:26319/${product.img}',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Image.network(
                            'http://147.185.221.20:26319/${product.img}',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Nama produk
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    // Rating, Ulasan, Terjual
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 5),
                        // rating
                        Text('${product.stars}',
                            style: const TextStyle(fontSize: 14)),
                        const SizedBox(width: 10),
                        Text('${product.totalRate} Reviews',
                            style: const TextStyle(fontSize: 14)),
                        const SizedBox(width: 10),
                        const Text('109 Sold', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // TabBar untuk "About Item" dan "Reviews"
                    const DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Colors.black,
                            indicatorColor: Colors.black,
                            tabs: [
                              Tab(text: "About Item"),
                              Tab(text: "Reviews"),
                            ],
                          ),
                          SizedBox(
                            height: 150,
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Brand: nama brand',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Color: warna',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(child: Text("No reviews yet")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bagian bawah untuk harga dan tombol "Buy Now"
          Obx(() => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Total Harga
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          'Rp 10000000',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                    // Tombol "Buy Now" dengan ikon keranjang dan jumlah item
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, // Warna tombol
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Membuat tombol melengkung
                        ),
                      ),
                      onPressed: () {
                        controller.addToCart();
                      },
                      child: Row(
                        children: [
                          // Ikon keranjang dan jumlah item
                          const Icon(Icons.shopping_bag, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            '${controller.cartItemCount.value}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Teks "Buy Now"
                          const Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
