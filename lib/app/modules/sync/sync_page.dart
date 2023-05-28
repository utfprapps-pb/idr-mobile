import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/sync/sync_controller.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class SyncPage extends GetView<SyncController> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      endDrawer: SideMenu(),
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sincronização',
                            style: UIConfig.titleStyle,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () =>
                            scaffoldKey.currentState!.openEndDrawer(),
                        icon: const Icon(
                          Icons.menu,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomElevatedButton(
                    title: 'Sincronicação forçada'.toUpperCase(),
                    onPressedCallBack: () {
                      Get.toNamed(Routes.FORCED_SYNC);
                      // if (controller.formKey.currentState!.validate()) {
                      //   controller.onFormSubmit();
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
