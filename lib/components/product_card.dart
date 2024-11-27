import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 209,
      width: 187,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 3),
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          border: Border.all(color: Colors.black12, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.network(
              product.imageUrl,
              width: 160,
              height: 100,
            ),
          ),
           Text(
            product.name,
            style: TextStyle(
                color: Color(0xff000000),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 13,
            width: 74,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  size: 15,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${product.price} IQD",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff007AFF),
                      borderRadius: BorderRadius.circular(8)),
                  height: 26,
                  width: 26,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: SvgPicture.asset(
                      "assets/icons/cart-add.svg",
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
