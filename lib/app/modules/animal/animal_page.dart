import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/animal_controller.dart';
import 'package:idr_mobile/app/modules/home/home_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/app/widgets/top_wave_custom_painter.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class AnimalPage extends GetView<AnimalController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      endDrawer: SideMenu(),
      key: controller.scaffoldKey,
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
                            'Animais',
                            style: UIConfig.titleStyle,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => controller.openEndDrawer(),
                        icon: const Icon(
                          Icons.menu,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: controller.animalsFinal.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var animal = controller.animalsFinal[index];
                          return ListTile(
                            leading: const Icon(Icons.pets_rounded),
                            title: Text('${animal.id} - ${animal.bornDate}'),
                            subtitle: Text('${animal.name}'),
                            trailing: const Icon(Icons.more_vert),
                          );
                        },
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
