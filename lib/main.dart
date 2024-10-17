import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ungdunggiuaki/list_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Khởi tạo Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản Lý Sản Phẩm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListProductScreen(),
    );
  }
}