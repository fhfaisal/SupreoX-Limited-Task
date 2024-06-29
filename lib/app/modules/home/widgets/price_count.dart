import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../model/menu-model.dart';
class PriceAndCount extends StatelessWidget {
  const PriceAndCount({
    super.key,
    required this.item,
    required this.controller,
  });

  final MenuItem item;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${item.price.toStringAsFixed(0)}',
          style: TextStyle(fontSize: 20, color: Color(0xff02308E)),
        ),
        const SizedBox(height: 5),
        item.quantity == 0
            ? Container(
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xffFF6B23)),
          ),
          child: GestureDetector(
            onTap: () {
              controller.incrementQuantity(item);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Text(
                  'Add',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        )
            : Container(
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xffFF6B23)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  controller.decrementQuantity(item);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.remove,
                    size: 20,
                  ),
                ),
              ),
              Text(
                item.quantity.toString(),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    controller.incrementQuantity(item);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}