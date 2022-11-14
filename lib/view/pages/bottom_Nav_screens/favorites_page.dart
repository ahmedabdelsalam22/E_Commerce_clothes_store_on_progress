import 'package:flutter/material.dart';

import '../../../utilities/color_manager.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: const Center(
        child: Text('FavoritesPage'),
      ),
    );
  }
}
