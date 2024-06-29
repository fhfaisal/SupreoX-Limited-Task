import 'package:flutter/material.dart';

import '../model/menu-model.dart';
class NameAndDescription extends StatelessWidget {
  const NameAndDescription({
    super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name),
            Text('Lorem ipsum dolor sit amet consectetur.'),
          ],
        ));
  }
}