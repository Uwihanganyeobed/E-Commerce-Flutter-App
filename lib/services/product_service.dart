import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final CollectionReference _productsCollection = 
      FirebaseFirestore.instance.collection('products');

  // Get all products
  Stream<List<Product>> getProducts() {
    return _productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Product(
          id: doc.id,
          name: data['name'],
          price: data['price'].toDouble(),
          imageUrl: data['imageUrl'],
          description: data['description'],
        );
      }).toList();
    });
  }

  // Add a product
  Future<void> addProduct(Product product) {
    return _productsCollection.add({
      'name': product.name,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'description': product.description,
    });
  }

  // Update a product
  Future<void> updateProduct(String id, Product product) {
    return _productsCollection.doc(id).update({
      'name': product.name,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'description': product.description,
    });
  }

  // Delete a product
  Future<void> deleteProduct(String id) {
    return _productsCollection.doc(id).delete();
  }
} 