import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'providers/cart_provider.dart'; // Import CartProvider
import 'home_page.dart';
import 'types/cart_page.dart';
import 'about.dart';
import 'payment.dart';
import 'confirmation_page.dart';
import 'things_type.dart';
import 'types/rice_items.dart'; // Updated import name to match file name
// Import other item type pages
import 'types/spice_items.dart';
import 'types/masalas_items.dart';
import 'types/dry_fruits_items.dart';
import 'types/oil_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(), // Provide CartProvider
      child: MaterialApp(
        title: 'Fresh Groceries',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/cart': (context) => CartPage(),
          '/about': (context) => AboutPage(),
          '/payment': (context) {
            final totalAmount =
                ModalRoute.of(context)!.settings.arguments as double?;
            return PaymentPage(totalAmount: totalAmount ?? 0.0);
          },
          '/confirmation': (context) => ConfirmationPage(),
          '/things_type': (context) => ThingsType(),
          '/rice_items': (context) => RiceItemsPage(),
          '/spices_items': (context) => SpiceItemsPage(),
          '/masalas_items': (context) => MasalasItemsPage(),
          '/dry_fruits_items': (context) => DryFruitsItemsPage(),
          '/oils_items': (context) => OilItemsPage(),
        },
      ),
    );
  }
}
