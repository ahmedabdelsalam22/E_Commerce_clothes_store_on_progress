import 'package:flutter/material.dart';

import '../../../utilities/color_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: const Center(
        child: Text('ProfilePage'),
      ),
    );
  }
}
