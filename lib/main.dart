import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapps/controller/homescreen_controller.dart';
import 'package:shoppingapps/controller/productsdetails_controller.dart';
import 'package:shoppingapps/view/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsdetailsController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
