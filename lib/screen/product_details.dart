import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, ProductProvider provider, Widget? child) {
        if (provider.selectProduct == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Loading..."),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(provider.selectProduct != null
                ? "Details of ${provider.selectProduct!.id}"
                : "Product Details"),
          ),
          body: provider.selectProduct == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        provider.selectProduct!.image ?? "Not Found",
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported),
                      ),
                    ),
                    Text(provider.selectProduct!.title ?? "Not Found"),
                    Text("${provider.selectProduct!.price}"),
                    Text(provider.selectProduct!.category ?? "Not Found"),
                  ],
                ),
        );
      },
    );
  }
}
