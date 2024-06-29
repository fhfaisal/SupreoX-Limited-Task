import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breakfast'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.menuItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.menuItems[index];
                    return Card(
                      child: ListTile(
                        leading: item.imageUrl.isNotEmpty
                            ? CachedNetworkImage(
                          width: 100,
                          height: 100,
                          imageUrl: item.imageUrl,
                        )
                      : Text('loading'),

                        title: Text(item.name),
                        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                        trailing: item.quantity == 0
                            ? ElevatedButton(
                          onPressed: () {
                            controller.incrementQuantity(item);
                          },
                          child: const Text('Add'),
                        )
                            : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.decrementQuantity(item);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              onPressed: () {
                                controller.incrementQuantity(item);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Obx(() {
              return Column(
                children: [
                  ListTile(
                    title: Text('Subtotal'),
                    trailing: Text('\$${controller.subtotal.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: Text('VAT(${controller.vat.value}%)'),
                    trailing: Text('\$${(controller.subtotal * (controller.vat.value / 100)).toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: Text('Total'),
                    trailing: Text('\$${controller.total.toStringAsFixed(2)}'),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}