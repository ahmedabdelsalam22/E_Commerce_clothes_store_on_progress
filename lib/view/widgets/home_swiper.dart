import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce/utilities/app_assets.dart';
import 'package:flutter/material.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({Key? key}) : super(key: key);

  static List<String> offerImages = [
    AppAssets.swiperCartOne,
    AppAssets.swiperCartTwo,
    AppAssets.swiperCartThree,
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.28,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            offerImages[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: offerImages.length,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Colors.white, activeColor: Colors.red),
        ),
        // control: SwiperControl(color: Colors.black),
      ),
    );
  }
}
