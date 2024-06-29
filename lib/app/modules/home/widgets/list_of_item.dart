import 'package:flutter/material.dart';
import 'package:supreox/app/modules/home/widgets/price_count.dart';

import '../../../utils/widgets/dotted_divider.dart';
import '../controllers/home_controller.dart';
import 'package:get/get.dart';

import 'item_image.dart';
import 'name_and_description.dart';
class ListOfItems extends StatelessWidget {
  const ListOfItems({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
      ),
      child: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.menuItems.length,
          itemBuilder: (context, index) {
            final item = controller.menuItems[index];
            return Column(
              children: [
                Row(
                  children: [
                    ItemImage(item: item),
                    const SizedBox(width: 10),
                    NameAndDescription(item: item),
                    PriceAndCount(item: item, controller: controller),
                  ],
                ),
                index != controller.menuItems.length - 1
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Transform.rotate(
                          angle: 125,
                          child: Container(
                            width: 5,
                            height: 5,
                            color: const Color(0xffFF6B23),
                          )),
                      const Expanded(
                        child: DottedDivider(
                          height: 1,
                          dashWidth: 2,
                          color: Color(0xffFF6B23),
                        ),
                      ),
                      Transform.rotate(
                          angle: 125,
                          child: Container(
                            width: 5,
                            height: 5,
                            color: const Color(0xffFF6B23),
                          )),
                    ],
                  ),
                )
                    : const SizedBox()
              ],
            );
          },
        );
      }),
    );
  }
}