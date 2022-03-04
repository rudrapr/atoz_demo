import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lrnr_demo/home/models/categories_model.dart';

class CategoriesItem extends StatelessWidget {
  final Data data;

  const CategoriesItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.grey.shade200, width: 2),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: 'https://atozzones.com/atoz-store.jpg',
                    ),
                  ),
                  Positioned.fill(
                      child: Container(
                    color: Colors.purpleAccent.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        data.sSource!.name!.substring(0, 1),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
                ],
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Text(
            data.sSource!.name!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
        )
      ]),
    );
  }
}
