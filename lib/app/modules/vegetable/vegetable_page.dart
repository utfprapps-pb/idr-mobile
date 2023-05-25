import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_vegetable_menu.dart';
import 'package:idr_mobile/app/modules/vegetable/vegetable_controller.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class VegetablePage extends GetView<VegetableController> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  VegetableMenuType? selectedMenu;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      endDrawer: SideMenu(),
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16, top: 32.0),
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
                          'Vegetables',
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        onPressedCallBack: () =>
                            controller.goToForm(null, null),
                        title: "Adicionar vegetables",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Obx(() {
                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: controller.vegetablesFinal.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var vegetable = controller.vegetablesFinal[index];
                        return PopupMenuButton<VegetableMenuType>(
                          initialValue: selectedMenu,
                          onSelected: (VegetableMenuType item) {
                            switch (item) {
                              // case VegetableMenuType.plague:
                              //   controller.goToNextPage(
                              //       vegetable, Routes.INSEMINATION);
                              //   break;
                              // case VegetableMenuType.disease:
                              //   controller.goToNextPage(
                              //       vegetable, Routes.MASTITIS);
                              //   break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              _itemsPopMenu(),
                          child: CustomSlidable(
                            identity: index,
                            content: '${vegetable.name ?? ''}',
                            title: '${vegetable.id ?? index + 1}',
                            icon: Icons.local_florist_rounded,
                            onPressedEditCallBack: (BuildContext context) {
                              controller.goToForm(vegetable, index);
                            },
                            onPressedRemoveCallBack: (BuildContext context) {
                              controller.removeVegetable(vegetable);
                            },
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PopupMenuEntry<VegetableMenuType>> _itemsPopMenu() {
    return [
      PopupMenuItem<VegetableMenuType>(
        value: VegetableMenuType.disease,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                vegetableMenusType[VegetableMenuType.disease.name].toString(),
              ),
            )
          ],
        ),
      ),
      PopupMenuItem<VegetableMenuType>(
        value: VegetableMenuType.plague,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                vegetableMenusType[VegetableMenuType.plague.name].toString(),
              ),
            )
          ],
        ),
      ),
    ];
  }
}
