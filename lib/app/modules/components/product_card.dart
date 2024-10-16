import 'package:e_qurban/app/data/models/cows.dart';
import 'package:e_qurban/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.DETAIL_PRODUCT, arguments: product);
        print("Card ditekan");
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian gambar produk
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://147.185.221.20:26319/${product.img}'), // Ganti dengan URL gambar produk
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      Image.network(
                        'http://147.185.221.20:26319/${product.img}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            child: const Center(
                              child: Text(
                                'No Image',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Kategori produk (contoh: "Kambing atau Sapi")
              Text(
                product.category.name,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 4),

              // Nama produk
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Rating dan jumlah ulasan
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text('${product.stars} | ${product.totalRate}'),
                ],
              ),

              const SizedBox(height: 8),

              // Harga produk
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Icon(Icons.favorite_border, color: Colors.pink),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
