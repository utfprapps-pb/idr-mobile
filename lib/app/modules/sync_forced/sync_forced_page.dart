import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/sync_forced/sync_forced_controller.dart';
import 'package:idr_mobile/app/widgets/custom_loading.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';

class SyncForcedPage extends GetView<SyncForcedController> {
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
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 32.0),
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
                            'Sincronização Forçada',
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
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * 0.40,
                        child: Text(
                          'Modulo',
                          style: UIConfig.textHeadStyle,
                        ),
                      ),
                      Text(
                        'Status',
                        style: UIConfig.textHeadStyle,
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          thickness: 1.2,
                        ),
                        itemCount: controller.syncFinishedList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var synchronized = controller.syncFinishedList[index];

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width * 0.40,
                                child: Text(
                                  synchronized.name.toString(),
                                  style: UIConfig.subtitleStyle,
                                ),
                              ),
                              synchronized.status == -1
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: UIColors.primaryColor,
                                        strokeWidth: 1.5,
                                      ),
                                    )
                                  : synchronized.status == 1
                                      ? Icon(
                                          Icons.check,
                                          size: 30,
                                          color: UIColors.successColor,
                                        )
                                      : SizedBox(
                                          height: 30.0,
                                          width: 30.0,
                                          child: IconButton(
                                            padding: const EdgeInsets.all(0.0),
                                            color: UIColors.warningColor,
                                            icon: const Icon(
                                              Icons.clear,
                                              size: 30.0,
                                            ),
                                            onPressed: () => AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.warning,
                                              animType: AnimType.topSlide,
                                              title: 'Ocorreu uma exceção',
                                              desc: synchronized.errorMessage
                                                  .toString(),
                                            )..show(),
                                          ),
                                        ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 60,
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
