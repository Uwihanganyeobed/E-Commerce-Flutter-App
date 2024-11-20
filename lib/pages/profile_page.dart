import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email'),
                    subtitle: Text('john.doe@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text('Orders'),
                    subtitle: Text('5 orders'),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Wishlist'),
                    subtitle: Text('3 items'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
