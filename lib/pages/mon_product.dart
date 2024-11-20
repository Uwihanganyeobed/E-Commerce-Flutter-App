import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commercer/providers/cart_provider.dart';
import 'package:e_commercer/models/product.dart';
import 'package:e_commercer/pages/cart_page.dart';

class MonProduct extends StatelessWidget {
  final String? productId;
  final String? productName;
  final double? price;
  final String? imageUrl;
  final String? description;

  const MonProduct({
    super.key,
    this.productId,
    this.productName,
    this.price,
    this.imageUrl,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName ?? 'Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cartItems: Provider.of<CartProvider>(context).items,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Hero(
                tag: 'product-$productId',
                child: Image.network(
                  imageUrl ?? 'https://placeholder.com/350',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    productName ?? 'Product Name',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 8),

                  // Price
                  Text(
                    '\$${price?.toStringAsFixed(2) ?? '0.00'}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 16),

                  // Description Title
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 8),

                  // Description Text
                  Text(
                    description ?? 'No description available',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 24),

                  // Quantity Selector
                  Row(
                    children: [
                      const Text(
                        'Quantity:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                // Implement decrease quantity
                              },
                            ),
                            const Text('1'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                // Implement increase quantity
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            final cart = Provider.of<CartProvider>(context, listen: false);
            cart.addItem(Product(
              id: productId ?? 'default_id',
              name: productName ?? 'Unnamed Product',
              price: price ?? 0.0,
              imageUrl: imageUrl ?? 'https://placeholder.com/350',
              description: description ?? 'No description available',
            ));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product added to cart'),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pushNamed(context, '/cart');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
