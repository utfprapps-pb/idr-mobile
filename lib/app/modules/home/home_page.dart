import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/home/home_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/app/widgets/top_wave_custom_painter.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class HomePage extends GetView<HomeController> {
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
                          Obx(
                            () => Text(
                              'Olá, ${controller.displayName.value}',
                              style: UIConfig.textStyle,
                            ),
                          ),
                          Text(
                            'Bem vindo de volta',
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
                  Obx(
                    () => TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        suffixIcon: controller.isEmptyInput.value
                            ? IconButton(
                                onPressed: () => controller.cleanInput(),
                                icon: Icon(Icons.close),
                              )
                            : Icon(Icons.search),

                        // icon: Icon(Icons.person),
                        hintText: 'Pesquisar',
                      ),
                      controller: controller.searchController.value,
                      onChanged: (_) => controller.onChangeSearch(_),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: controller.propertiesShowList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var property = controller.propertiesShowList[index];
                          return ListTile(
                            leading: const Icon(Icons.terrain),
                            title: Text(
                                '${property.id} - ${property.ocupationArea}'),
                            subtitle: Text('${property.ocupationArea}'),
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
