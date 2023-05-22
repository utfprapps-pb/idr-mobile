import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/mastitis/mastitis_controller.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';

class MastitisPage extends GetView<MastitisController> {
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
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                'Mastites ${controller.animal.value.name}',
                                style: UIConfig.titleStyle,
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle.disabled,
                              ),
                            ),
                          ],
                        ),
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
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomOutlinedButton(
                          onPressedCallBack: () =>
                              controller.goToForm(null, null),
                          title: "Registrar mastite",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(() {
                      return controller.mastitisFinal.isNotEmpty
                          ? ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: controller.mastitisFinal.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var mastitis = controller.mastitisFinal[index];
                                return CustomSlidable(
                                  identity: index,
                                  title:
                                      '${mastitis.id ?? index} - ${mastitis.dateDiagnostic}',
                                  content:
                                      'Animal: ${mastitis.animalIdentifier}',
                                  icon: Icons.medical_information,
                                  onPressedEditCallBack:
                                      (BuildContext context) {
                                    controller.goToForm(mastitis, index);
                                  },
                                  onPressedRemoveCallBack:
                                      (BuildContext context) {
                                    controller.removeMastitis(mastitis);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "Nenhuma mastite registrada para este animal.",
                              ),
                            );
                    }),
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
