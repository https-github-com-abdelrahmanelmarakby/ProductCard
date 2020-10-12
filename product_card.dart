import 'package:dvina/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key key,
      @required this.productImage,
      @required this.productTitle,
      this.productPrice,
      this.productIcon})
      : super(key: key);

  final productImage;
  final productTitle;
  final productPrice;
  final productIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.PRODUCT_DETAILS,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        elevation: 8,
        shadowColor: Colors.red,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.network(
                      productImage,
                      height: Get.height / 8,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    productTitle,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Text(productPrice),
                Container(
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  width: Get.width,
                  child: Center(
                    child: Text(
                      productTitle,
                      style: TextStyle(color: mainColor),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                child: Icon(
                  Icons.favorite_border,
                  color: accentColor,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
