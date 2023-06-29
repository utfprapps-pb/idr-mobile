import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/medication/medication_controller.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';

class MedicationPage extends GetView<MedicationController> {
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
                            Text(
                              'Medicamentos',
                              style: UIConfig.titleStyle,
                              overflow: TextOverflow.ellipsis,
                              strutStyle: StrutStyle.disabled,
                            ),
                            Obx(
                              () => Text(
                                'Animal: ${controller.animal.value.identifier}',
                                style: UIConfig.subtitleStyle,
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
                          title: "Registrar Medicamento",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(() {
                      return controller.medicationsFinal.isNotEmpty
                          ? ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: controller.medicationsFinal.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var medication =
                                    controller.medicationsFinal[index];
                                return CustomSlidable(
                                  identity: index,
                                  title:
                                      '${medication.id ?? index + 1} - ${medication.applicationDate}',
                                  content: '${medication.activePrinciple}',
                                  icon: Icons.medication_liquid_rounded,
                                  onPressedEditCallBack:
                                      (BuildContext context) {
                                    controller.goToForm(medication, index);
                                  },
                                  onPressedRemoveCallBack:
                                      (BuildContext context) {
                                    controller.removeMedication(medication);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "Nenhum medicamento registrado para este animal.",
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
