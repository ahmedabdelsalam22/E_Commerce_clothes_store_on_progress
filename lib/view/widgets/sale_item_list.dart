import 'package:ecommerce/controller/database_controller.dart';
import 'package:ecommerce/utilities/color_manager.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';

class SaleItemList extends StatelessWidget {
  const SaleItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return SizedBox(
      height: 320,
      child: StreamBuilder<List<Product>>(
        stream: database.salesProductsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final products = snapshot.data;
            if (products == null) {
              return const Center(
                child: Text('No Data Found!'),
              );
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return saleItemBuilder(products[index], context);
              },
              itemCount: products.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget saleItemBuilder(Product product, context) {
    final size = MediaQuery.of(context).size;
    bool isFav = false;
    void changeFavIcon() {
      isFav = !isFav;
    }

    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetailsPageRoute, arguments: product),
      child: Padding(
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
                  child: Image(
                    image: NetworkImage(
                      product.imgUrl,
                    ),
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
                      '-${product.discountValue}%',
                    )),
                  ),
                ),
                Positioned(
                  left: size.width * 0.23,
                  bottom: size.height * 0.011,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.5)),
                        child: Icon(
                          isFav ? IconlyBold.heart : IconlyLight.heart,
                          size: 30,
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RatingBarIndicator(
              itemSize: 25.0,
              rating: product.rate?.toDouble() ?? 4.0,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              direction: Axis.horizontal,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              product.title,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              product.category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('${product.oldPrice}\$',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  width: 5,
                ),
                if (product.discountValue != 0)
                  Text(
                    '${product.oldPrice * (product.discountValue) / 100}\$',
                    style: TextStyle(color: ColorManager.primary),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/*  ratingBar(int? rate) {
    return SizedBox(
      child: Row(
        children: [
          RatingBar.builder(
            itemSize: 20,
            initialRating: rate!.toDouble(),
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
          Text('$rate'),
        ],
      ),
    );
  }*/
}
