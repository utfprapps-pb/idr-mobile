import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/medicine/medicine_controller.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';

class MedicinePage extends GetView<MedicineController> {
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
                                'Medicamentos ${controller.animal.value.identifier}',
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
                      return controller.medicinesFinal.length > 0
                          ? ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: controller.medicinesFinal.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var medicine = controller.medicinesFinal[index];
                                return CustomSlidable(
                                  identity: index,
                                  title:
                                      '${medicine.id ?? index} - ${medicine.date}',
                                  content: '${medicine.name}',
                                  icon: Icons.child_friendly_rounded,
                                  onPressedEditCallBack:
                                      (BuildContext context) {
                                    controller.goToForm(medicine, index);
                                  },
                                  onPressedRemoveCallBack:
                                      (BuildContext context) {
                                    controller.removeMedicine(medicine);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "Nenhuma medicamento registrada para este animal.",
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
