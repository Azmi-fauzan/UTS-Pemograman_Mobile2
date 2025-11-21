import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/order_cubit.dart';
import 'pages/category_stack_page.dart';
import 'models/menu_model.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => OrderCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryStackPage(
        makananList: [
          Order(
            id: "1",
            name: "Nasi Goreng",
            price: 15000,
            category: "Makanan",
            discount: 0.0,
            quantity: 1,
          ),
          Order(
            id: "2",
            name: "Ayam Geprek",
            price: 17000,
            category: "Makanan",
            discount: 0.1,
            quantity: 1,
          ),
        ],
        minumanList: [
          Order(
            id: "3",
            name: "Es Teh",
            price: 5000,
            category: "Minuman",
            discount: 0.0,
            quantity: 1,
          ),
          Order(
            id: "4",
            name: "Jus Jeruk",
            price: 8000,
            category: "Minuman",
            discount: 0.05,
            quantity: 1,
          ),
        ],
      ),
    );
  }
}
