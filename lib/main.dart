import 'package:e_commercer/pages/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:e_commercer/providers/cart_provider.dart';
import 'package:e_commercer/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/shop_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'KLS E-Commerce',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/shop': (context) => const ShopPage(),
          '/about': (context) => const AboutPage(),
          '/contact': (context) => const ContactPage(),
          '/profile': (context) => const ProfilePage(),
          '/auth': (context) => const AuthPage(),
          '/cart': (context) => const CartPage(cartItems: [],),
        },
      ),
    );
  }
}
