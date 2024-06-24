import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class SgTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// if want to add background color to tabbar so  thats why we use
  /// customm tabbar with preferedSizeWidget
  const SgTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? SgColors.black : SgColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        labelColor: dark ? SgColors.white : SgColors.primary,
        indicatorColor: SgColors.primary,
        unselectedLabelColor: SgColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SgDeviceUtils.getAppBarHeight());
}
