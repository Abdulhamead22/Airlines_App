import 'package:flutter/material.dart';
import 'package:flutter_application_1/dio_helper.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:provider/provider.dart';

class AllproductScreen extends StatelessWidget {
  const AllproductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Product"),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return provider.products == null || provider.products!.isEmpty
                ? const Center(
                    child: Text(
                        "No Products Available")) // عرض رسالة في حال عدم وجود منتجات
                : ListView.builder(
                    itemCount: provider.products!.length,
                    itemBuilder: (context, index) {
                      return Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  DioHelper.dioHelper.getCategories();
                                },
                                child: const Text('Test')),
                            SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                provider.products![index].image ?? "Not Found",
                              ),
                            ),
                            Text(provider.products![index].title ?? "Not Found"),
                        
                       ],
                       );
                    });
          },
        ),);
  }
}
