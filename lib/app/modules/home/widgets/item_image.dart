import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/widgets/dash_border.dart';
import '../model/menu-model.dart';
class ItemImage extends StatelessWidget {
  const ItemImage({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return item.imageUrl.isNotEmpty
        ? DottedBorderContainer(
      backgroundColor: const Color(0XFFfff1e9),
      borderRadius: 10,
      child: Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: CachedNetworkImage(
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            imageUrl: item.imageUrl,
            placeholder: (context, url) => const Center(child: Text('loading')),
          ),
        ),
      ),
    )
        : const Text('loading');
  }
}