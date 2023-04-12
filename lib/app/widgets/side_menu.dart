import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/services/auth/auth_service.dart';
import 'package:idr_mobile/app/widgets/side_menu_tile.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class SideMenu extends StatefulWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  AuthService auth = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Olá, ${auth.displayName()}',
                          style: UIConfig.textStyle,
                        ),
                      ],
                    ),
                  ),
                  SideMenuTile(
                    icon: Icons.home_outlined,
                    text: 'Home',
                    onTap: () {
                      if (Get.currentRoute != Routes.HOME) {
                        Get.offNamed(Routes.HOME);
                      } else {
                        Get.back();
                      }
                    },
                    isSelected: Get.currentRoute == Routes.HOME,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SideMenuTile(
                icon: Icons.logout,
                isSelected: false,
                text: 'Logout',
                onTap: () {
                  auth.logout();
                  Get.offNamed(Routes.LOGIN);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
