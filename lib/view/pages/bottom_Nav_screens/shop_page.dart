import 'package:flutter/material.dart';

import '../../../utilities/color_manager.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Center(
        child: Text('ShopPage'),
      ),
    );
  }
}
