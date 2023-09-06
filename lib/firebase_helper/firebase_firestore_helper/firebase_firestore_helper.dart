import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:havenmall/models/products_Model/products_Model.dart';

import '../../models/catergories_Model/categories_Model.dart';

class FirestoreHelper {
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static Future<List<CategoriesModel>> getcategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection("categories").get();

      List<CategoriesModel> categorieslist = querySnapshot.docs
          .map((e) => CategoriesModel.fromJson(e.data()))
          .toList();
      print('category list $categorieslist');

      return categorieslist;
    } catch (e) {
      print("empty lisy $e");
      return [];
    }
  }

  static Future<List<ProductModel>> getTopSellingProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collectionGroup("products").get();

      List<ProductModel> Productlist = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      print('Products list $Productlist');

      return Productlist;
    } catch (e) {
      print(" Products empty list $e");
      return [];
    }
  }
}
