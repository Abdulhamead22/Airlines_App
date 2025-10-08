

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:flutter_application_1/screen/product_details.dart';
import 'package:provider/provider.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return provider.products == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.categories?.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                provider
                                    .changeIndex(provider.categories![index]);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                decoration: BoxDecoration(
                                  color: provider.categories?[index] ==
                                          provider.selectedIndex
                                      ? Colors.amberAccent
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(provider.categories![index]),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: provider.products == null
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    print(
                                        "Navigating to product with ID: ${provider.products![index].id}");
                                    provider
                                        .getDetail(
                                            provider.products![index].id!)
                                        .then((_) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductDetails(),
                                      ));
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Image.network(
                                            provider.products![index]
                                                    .image ??
                                                "Not Found",
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error,
                                                    stackTrace) =>
                                                const Icon(Icons
                                                    .image_not_supported),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            provider.products![index]
                                                    .title ??
                                                "Not Found",
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
