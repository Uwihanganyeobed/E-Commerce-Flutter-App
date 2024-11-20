import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commercer/models/product.dart';
import 'package:e_commercer/data/products_data.dart';
import 'mon_product.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: Column(
        children: [
          // Carousel Section
          CarouselSlider.builder(
            itemCount: productsData.length,
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            itemBuilder: (context, index, realIndex) {
              final product = Product(
                id: productsData[index]['id'],
                name: productsData[index]['name'],
                price: productsData[index]['price'],
                imageUrl: productsData[index]['imageUrl'],
                description: productsData[index]['description'],
              );

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MonProduct(
                        productId: product.id,
                        productName: product.name,
                        price: product.price,
                        imageUrl: product.imageUrl,
                        description: product.description,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Stack(
                      children: [
                        Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            child: Text(
                              '${product.name} - \$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Existing Grid View
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: productsData.length,
              itemBuilder: (context, index) {
                final product = Product(
                  id: productsData[index]['id'],
                  name: productsData[index]['name'],
                  price: productsData[index]['price'],
                  imageUrl: productsData[index]['imageUrl'],
                  description: productsData[index]['description'],
                );

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MonProduct(
                          productId: product.id,
                          productName: product.name,
                          price: product.price,
                          imageUrl: product.imageUrl,
                          description: product.description,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.network(
                            // Using Image.network assuming your products use URLs
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('\$${product.price.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
