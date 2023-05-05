import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/property/property_controller.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_list_tile.dart';

class PropertyPage extends GetView<PropertyController> {
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
                            'Propriedade',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Obx(
                            () => Text(
                              '${controller.property.value.ocupationArea}',
                              style: UIConfig.titleStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Text(
                              'Latitude: ${controller.property.value.latitude ?? ''}',
                              style: UIConfig.textStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => Text(
                              'Longitude: ${controller.property.value.longitude ?? ''}',
                              style: UIConfig.textStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => Text(
                              'Arrendado: ${controller.property.value.leased == true ? 'Sim' : 'Não'}',
                              style: UIConfig.textStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => Text(
                              'Área total: ${controller.property.value.totalArea ?? ''}',
                              style: UIConfig.textStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
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
