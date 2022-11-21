import 'package:ecommerce/utilities/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/product_model.dart';

class SaleItemList extends StatelessWidget {
  const SaleItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return saleItemBuilder(dummyProducts[index]);
        },
        itemCount: dummyProducts.length,
      ),
    );
  }

  Widget saleItemBuilder(Product dummyProduct) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              SizedBox(
                width: 145,
                height: 210,
                child: Image.asset(
                  dummyProduct.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                      child: Text(
                    '-${dummyProduct.discountValue}%',
                  )),
                ),
              ),
              /* Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(IconlyLight.heart),
                ),
              ),*/
            ],
          ),
          ratingBar(),
          const SizedBox(
            height: 3,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            dummyProduct.title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            dummyProduct.category,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text('${dummyProduct.discountValue}\$',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  )),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${dummyProduct.price * (dummyProduct.discountValue) / 100}\$',
                style: TextStyle(color: ColorManager.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ratingBar() {
    return SizedBox(
      child: Row(
        children: [
          RatingBar.builder(
            itemSize: 23,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
          const Text('5'),
        ],
      ),
    );
  }
}
