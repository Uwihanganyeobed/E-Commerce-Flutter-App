import 'package:flutter/material.dart';
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
      body: GridView.builder(
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
