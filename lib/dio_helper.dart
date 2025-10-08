import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/get_product.dart';
import 'package:flutter_application_1/models/post_request.dart';

/*
put: use same post but to update
patch: use same post but to change
 */

class DioHelper {
  DioHelper();
  static DioHelper dioHelper = DioHelper();
  Dio dio = Dio();
  Future<List<Product>> getAppProducts() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    //تحويل من ليست اوف ماب الى ليست اوف ريسونس
    List<dynamic> responseList = response.data;
    List<Product> products =
        responseList.map((e) => Product.fromJson(e)).toList();
    return products;
  }

  // Future<List<String>> getCategories() async {
  //   Response categories =
  //       await dio.get('https://fakestoreapi.com/products/category');
  //   List<dynamic> categoriesList = categories.data;
  //   List<String> catego = categoriesList.map((e) => e.toString()).toList();
  //   return catego;
  // }
  Future<List<String>> getCategories() async {
    try {
      Response response =
          await dio.get('https://fakestoreapi.com/products/categories');

      // طباعة الاستجابة لمعرفة هل هناك بيانات أم لا
      print("Response Data: ${response.data}");

      // التأكد أن الاستجابة ليست فارغة
      if (response.data == null || response.data.isEmpty) {
        throw Exception("No categories found");
      }

      List<dynamic> categoriesList = response.data;
      return categoriesList.map((e) => e.toString()).toList();
    } catch (e) {
      print("Error fetching categories: $e");
      return []; // إرجاع قائمة فارغة بدلاً من حدوث خطأ
    }
  }

  Future<List<Product>> getCategoriesProduct(String category) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/category/$category');

    List<dynamic> responseList = response.data;
    List<Product> products =
        responseList.map((e) => Product.fromJson(e)).toList();
    return products;
  }

  Future<Product> getDetailsProducts(int productId) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/$productId');
    print("Response Data: ${response.data}");
    return Product.fromJson(response.data);
  }

  createNewPost(PostRequest postRequest) async {
    Response response =
        await dio.post('https://jsonplaceholder.typicode.com/posts',
    data:
    postRequest
        .toJson()); //اذا كان المطلوب ينبعت عن طريق body select data but of header select queryparameter
    print(response.data.toString());
  }
}
