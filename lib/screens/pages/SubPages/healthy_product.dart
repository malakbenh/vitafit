import 'package:flutter/material.dart';
import 'package:vitafit/const/app_const.dart';

class HealthyProduct extends StatelessWidget {
  const HealthyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthy Products"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: Banners.healthyProduct.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9),
        itemBuilder: (BuildContext context, int index) {
          return Banners.healthyProduct[index];
        },
      ),
    );
  }
}
