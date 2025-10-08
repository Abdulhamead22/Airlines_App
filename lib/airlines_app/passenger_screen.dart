import 'package:flutter/material.dart';
import 'package:flutter_application_1/airlines_app/airlines_provider.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class PassengerScreen extends StatelessWidget {
  const PassengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Airlines"),
      ),
      body: Consumer<AirlinesProvider>(
        builder: (context, provider, child) {
           if (provider.passengers == null || provider.passengers!.isEmpty) {
      return const Center(child: Text("No passengers found"));
    }
          return LazyLoadScrollView(
            onEndOfPage: () {
            //  provider.getMorePassenger();
            },
            child: ListView.builder(
              itemCount: provider.passengers?.length,
              itemBuilder: (context, index) {
                return ListTile(
      title: Text(provider.passengers![index].name ?? "No Name"),
    );
                //PassengerWidget(provider.passengers![index]);
              },
            ),
          );
        },
      ),
    );
  }
}
