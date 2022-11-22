import 'package:flutter/material.dart';

import '../../widgets/home_swiper.dart';
import '../../widgets/new_item_list.dart';
import '../../widgets/sale_item_list.dart';
import '../../widgets/view_all.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeSwiper(),
          const SizedBox(
            height: 20,
          ),
          ViewAll(
            title: 'Sale',
            subtitle: 'Super summer sale',
            onPressed: () => debugPrint('view all btn'),
          ),
          const SizedBox(
            height: 20,
          ),
          ///////////////////////////////////
          const SaleItemList(),
          const SizedBox(
            height: 5,
          ),
          ViewAll(
            title: 'New',
            subtitle: 'You\'ve never seen it before!',
            onPressed: () => debugPrint('view all btn'),
          ),
          const SizedBox(
            height: 20,
          ),
          ////////////////////////////////////
          const NewItemList(),
        ],
      ),
    );
  }
}
