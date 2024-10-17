import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'product.dart';
import 'dart:io';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addProduct(Product product) async {
    await _firestore.collection('products').add(product.toJson()); // Thay toMap thành toJson
  }

  Future<void> updateProduct(Product product) async {
    await _firestore.collection('products').doc(product.id).update(product.toJson()); // Thay toMap thành toJson
  }

  Future<void> deleteProduct(String id) async {
    await _firestore.collection('products').doc(id).delete();
  }

  Stream<List<Product>> getProducts() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<String> uploadImage(String filePath) async {
    File file = File(filePath);
    String fileName = filePath.split('/').last;
    Reference ref = _storage.ref().child('product_images').child(fileName);
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}
