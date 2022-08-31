import 'package:flutter/material.dart';

import '../pages/theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 2),
              blurRadius: 4,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            child: Image.asset(
              "assets/images/${item['imgUrl']}",
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['nama'],
                  style: textStyle,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                if ((item['ketDiskon'] as String).contains("Diskon")) ...[
                  Text(
                    item['hargaDiskon'],
                    style: textStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ] else ...[
                  Text(
                    item['harga'],
                    style: textStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if ((item['ketDiskon'] as String).contains("Diskon")) ...[
                      Text(
                        item['harga'],
                        style: textStyle.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12),
                      ),
                    ],
                    Text(
                      item['ketDiskon'],
                      style: textStyle.copyWith(
                        color: blueColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
