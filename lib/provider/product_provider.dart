import 'package:flutter/material.dart';
import 'package:flutter_application_1/dio_helper.dart';
import 'package:flutter_application_1/models/get_product.dart';

//هوا الي بربط بين  ui and data
class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    getAllProducts();
    getAllCategories();
  }
  List<Product>? products;
  getAllProducts() async {
    products = await DioHelper.dioHelper.getAppProducts();
    notifyListeners(); //ينبه انو صار تغييرات
  }

  

  List<String>? categories;
  String? selectedIndex;
  getAllCategories() async {
    categories = await DioHelper.dioHelper.getCategories();
    notifyListeners(); //ينبه انو صار تغييرات
  }

  void changeIndex(String index) {
    selectedIndex = index;
    //  products = null;

    getCategoriesProduct(index);
    notifyListeners();
  }

  getCategoriesProduct(String index) async {
    products = await DioHelper.dioHelper.getCategoriesProduct(index);
    notifyListeners(); //ينبه انو صار تغييرات
  }

  Product? selectProduct;
  getDetail(int id) async {
    selectProduct = await DioHelper.dioHelper.getDetailsProducts(id);
    //  print("${selectProduct?.id}");
    notifyListeners();
  }
}
