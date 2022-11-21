import 'package:ecommerce/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilities/color_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Center(
        child: Consumer<AuthController>(
          builder: (_, value, __) {
            return TextButton(
              onPressed: () {
                value.logOut();
              },
              child: const Text('log Out'),
            );
          },
        ),
      ),
    );
  }
}
