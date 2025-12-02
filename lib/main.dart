import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manpro_kel3/providers/cart_provider.dart';
import 'package:manpro_kel3/providers/product_provider.dart';
import 'package:manpro_kel3/screens/home_screen.dart';
import 'package:manpro_kel3/screens/cart_screen.dart';
import 'package:manpro_kel3/screens/checkout_screen.dart';
import 'package:manpro_kel3/screens/order_confirmation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Toko Ella',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/cart':
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const CartScreen(),
                transitionsBuilder: (_, anim, __, child) =>
                    FadeTransition(opacity: anim, child: child),
              );
            default:
              return null;
          }
        },
        home: const HomeScreen(),
        routes: {
          '/cart': (context) => const CartScreen(),
          '/checkout': (context) => const CheckoutScreen(),
          '/order-confirmation': (context) =>
              const OrderConfirmationScreen(),
        },
      ),
    );
  }
}
