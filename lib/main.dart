import 'package:flutter/material.dart';
import 'package:flutter_application_1/airlines_app/airlines_provider.dart';
import 'package:flutter_application_1/airlines_app/passenger_screen.dart';
import 'package:flutter_application_1/dio_helper.dart';
import 'package:flutter_application_1/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<ProductProvider>(
        //   create: (context) {
        //     return ProductProvider();
        //   },
        // ),
ChangeNotifierProvider<AirlinesProvider>(
          create: (context) {
            return AirlinesProvider();
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PassengerScreen(),
      ),
    ),
  );
}


class AllproductScreen1 extends StatelessWidget {
  const AllproductScreen1({super.key});

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
                      return Row(
                          children: [
                            
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              DioHelper.dioHelper.getAppProducts();
            },
            child: const Text('Press')),
      ),
    );
  }
}
