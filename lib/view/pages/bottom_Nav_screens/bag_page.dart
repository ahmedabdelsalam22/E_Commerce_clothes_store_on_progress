import 'package:flutter/material.dart';

import '../../../utilities/color_manager.dart';

class BagPage extends StatelessWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: const Center(
        child: Text('BagPage'),
      ),
    );
  }
}
