import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import 'package:get/get.dart';
class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        decoration: BoxDecoration(
            color: const Color(0xffFFF1E9),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black)),
                Text('\$${controller.subtotal.toStringAsFixed(2)}',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Color(
                    0xffFF6B23))),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vat(5%) Service Charge included (5%))',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Color(0xff02308E))),
                Text('\$${(controller.subtotal * (controller.vat.value / 100)).toStringAsFixed(2)}',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Color(0xff02308E))),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: Color(0xffFF6B23),
              height: 2,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black)),
                Text('\$${controller.total.toStringAsFixed(2)}',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Color(
                    0xffFF6B23))),
              ],
            ),
          ],
        ),
      );
    });
  }
}