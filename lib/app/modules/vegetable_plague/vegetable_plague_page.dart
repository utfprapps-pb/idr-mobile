import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/vegetable_plague_controller.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class VegetablePlaguePage extends GetView<VegetablePlagueController> {
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
                          'Animais',
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
                        title: "Adicionar animais",
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
                      itemCount: controller.vegetablePlaguesFinal.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var vegetablePlague =
                            controller.vegetablePlaguesFinal[index];
                        return CustomSlidable(
                          identity: index,
                          title: '${vegetablePlague.id ?? index + 1}',
                          content: '${vegetablePlague.infestationType ?? ''}',
                          icon: Icons.pets,
                          onPressedEditCallBack: (BuildContext context) {
                            controller.goToForm(vegetablePlague, index);
                          },
                          onPressedRemoveCallBack: (BuildContext context) {
                            controller.removeVegetablePlague(vegetablePlague);
                          },
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
}
