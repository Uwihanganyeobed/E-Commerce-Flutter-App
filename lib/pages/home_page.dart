import 'package:flutter/material.dart';
import 'mon_product.dart';
import 'package:e_commercer/models/product.dart';
import 'package:e_commercer/data/products_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KLS E-Commerce'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.imgur.com/4y4QPNl.jpeg',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.green),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.green),
              title: const Text('Shop'),
              onTap: () {
                Navigator.pushNamed(context, '/shop');
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.green),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.contact_mail, color: Colors.green),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to KLS E-Commerce!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Explore our latest products below:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
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

                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/shop');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
