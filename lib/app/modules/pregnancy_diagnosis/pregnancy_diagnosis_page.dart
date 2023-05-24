import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/pregnancy_diagnosis_controller.dart';
import 'package:idr_mobile/app/widgets/custom_list_tile.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';

class PregnancyDiagnosisPage extends GetView<PregnancyDiagnosisController> {
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
                                'Diagnóssticos ${controller.animal.value.identifier}',
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
                          title: "Registrar diagnóstico de prenhez",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(() {
                      return controller.pregnancyDiagnosesFinal.length > 0
                          ? ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              itemCount:
                                  controller.pregnancyDiagnosesFinal.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var pregnancyDiagnosis =
                                    controller.pregnancyDiagnosesFinal[index];
                                return CustomSlidable(
                                  identity: index,
                                  title:
                                      '${pregnancyDiagnosis.id ?? index} - ${pregnancyDiagnosis.date}',
                                  content:
                                      '${pregnancyDiagnosis.animalIdentifier}',
                                  icon: Icons.child_friendly_rounded,
                                  onPressedEditCallBack:
                                      (BuildContext context) {
                                    controller.goToForm(
                                        pregnancyDiagnosis, index);
                                  },
                                  onPressedRemoveCallBack:
                                      (BuildContext context) {
                                    controller.removePregnancyDiagnosis(
                                        pregnancyDiagnosis);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "Nenhum diagnóstico de prenhez registrado para este animal.",
                                textAlign: TextAlign.center,
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
