import 'package:flutter/material.dart';
import 'mon_product.dart';
import 'package:e_commercer/models/product.dart';

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
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-vector/shopping-time-banner-with-realistic-map-cart-gift-bags-vector-illustration_548887-120.jpg',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(171, 141, 97, 97),
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.green),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.green),
              title: const Text('Shop'),
              onTap: () {
                Navigator.pushNamed(context, '/shop');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.green),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail, color: Colors.green),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const Divider(thickness: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                // Add logout logic here
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
                itemCount: 6,
                itemBuilder: (context, index) {
                  final product = Product(
                    id: 'product-$index',
                    name: 'Product ${index + 1}',
                    price: 9.99,
                    imageUrl: 'https://example.com/image.jpg',
                    description: 'Product description',
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
                        color: Colors.blueAccent,
                        elevation: 5,
                        child: Center(
                          child: Text(
                            'Product ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
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
