import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:supreox/app/modules/home/model/menu-model.dart';

import '../../../utils/widgets/dash_border.dart';
import '../../../utils/widgets/dotted_divider.dart';
import '../controllers/home_controller.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/item_image.dart';
import '../widgets/list_of_item.dart';
import '../widgets/name_and_description.dart';
import '../widgets/price_count.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    children: [
                      const Header(),
                      ListOfItems(controller: controller),
                    ],
                  ),
              ),
            ),
          ),
          Footer(controller: controller),
        ],
      ),
    );
  }
}














