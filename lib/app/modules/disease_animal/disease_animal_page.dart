import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/disease_animal/disease_animal_controller.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';

class DiseaseAnimalPage extends GetView<DiseaseAnimalController> {
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
                                'Doenças ${controller.animal.value.name}',
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
                          title: "Registrar Doença",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(() {
                      return controller.diseaseAnimalsFinal.length > 0
                          ? ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: controller.diseaseAnimalsFinal.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var diseaseAnimal =
                                    controller.diseaseAnimalsFinal[index];
                                return CustomSlidable(
                                  identity: index,
                                  title:
                                      '${diseaseAnimal.id ?? index} - ${diseaseAnimal.dateDiagnostic}',
                                  content: '${diseaseAnimal.diagnostic}',
                                  icon: Icons.child_friendly_rounded,
                                  onPressedEditCallBack:
                                      (BuildContext context) {
                                    controller.goToForm(diseaseAnimal, index);
                                  },
                                  onPressedRemoveCallBack:
                                      (BuildContext context) {
                                    controller
                                        .removeDiseaseAnimal(diseaseAnimal);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "Nenhuma doença registrada para este animal.",
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
