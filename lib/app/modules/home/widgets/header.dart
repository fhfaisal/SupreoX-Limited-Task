import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.1, 1],
              colors: [Color(0xffFF6B23), Color(0xffFF9727)])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Breakfast", textAlign: TextAlign.left, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
                Text("Vat(5%) Service Charge(5%)", textAlign: TextAlign.left, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Icon(CupertinoIcons.chevron_up,color: Colors.white,)
        ],
      ),
    );
  }
}