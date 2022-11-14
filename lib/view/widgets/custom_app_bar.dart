import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utilities/color_manager.dart';

class CustomAppBar extends StatelessWidget {
  Text? title;
  Widget? leading;
  List<Widget>? actions;
  bool? backIcon;

  CustomAppBar(
      {super.key, this.title, this.leading, this.actions, this.backIcon});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        title: title,
        leading: leading,
        actions: actions,
        automaticallyImplyLeading: backIcon!,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.backGround,
            statusBarBrightness: Brightness.dark),
      ),
    );
  }
}
