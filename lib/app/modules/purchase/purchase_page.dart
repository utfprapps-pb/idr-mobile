import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/purchase/purchase_controller.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';

class PurchasePage extends GetView<PurchaseController> {
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
                                'Compra ${controller.animal.value.identifier}',
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
                  Obx(
                    () => Visibility(
                      visible: controller.purchasesFinal.isEmpty,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomOutlinedButton(
                              onPressedCallBack: () =>
                                  controller.goToForm(null, null),
                              title: "Registrar compra",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(() {
                      return controller.purchasesFinal.isNotEmpty
                          ? ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: controller.purchasesFinal.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var purchase = controller.purchasesFinal[index];
                                return CustomSlidable(
                                  identity: index,
                                  title:
                                      '${purchase.id ?? index} - ${purchase.datePurchase}',
                                  content: '${purchase.animalIdentifier}',
                                  icon: Icons.monetization_on_rounded,
                                  onPressedEditCallBack:
                                      (BuildContext context) {
                                    controller.goToForm(purchase, index);
                                  },
                                  onPressedRemoveCallBack:
                                      (BuildContext context) {
                                    controller.removePurchase(purchase);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "Nenhuma compra registrada para este animal.",
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
