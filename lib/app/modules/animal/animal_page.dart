import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_menu.dart';
import 'package:idr_mobile/app/data/models/animal_model.dart';
import 'package:idr_mobile/app/modules/animal/animal_controller.dart';
import 'package:idr_mobile/app/widgets/custom_loading.dart';
import 'package:idr_mobile/app/widgets/custom_outlined_button.dart';
import 'package:idr_mobile/app/widgets/custom_slidable.dart';
import 'package:idr_mobile/app/widgets/side_menu.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/routes/app_pages.dart';

class AnimalPage extends GetView<AnimalController> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AnimalMenuType? selectedMenu;

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
                        Obx(
                          () => Text(
                            'Propriedade: ${controller.property.value.id}',
                            style: UIConfig.subtitleStyle,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle.disabled,
                          ),
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
                        title: "Adicionar Animal",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return customLoading;
                    } else if (controller.animalsFinal.isEmpty) {
                      return Center(
                        child: Text(
                          'Nenhum animal encontrado.',
                          style: UIConfig.textLabelStyle,
                        ),
                      );
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: controller.animalsFinal.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var animal = controller.animalsFinal[index];
                          return PopupMenuButton<AnimalMenuType>(
                            initialValue: selectedMenu,
                            onSelected: (AnimalMenuType item) {
                              switch (item) {
                                case AnimalMenuType.insemination:
                                  controller.goToNextPage(
                                      animal, Routes.INSEMINATION);
                                  break;
                                case AnimalMenuType.mastitis:
                                  controller.goToNextPage(
                                      animal, Routes.MASTITIS);
                                  break;
                                case AnimalMenuType.disease:
                                  controller.goToNextPage(
                                      animal, Routes.DISEASE_ANIMAL);
                                  break;
                                case AnimalMenuType.medications:
                                  controller.goToNextPage(
                                      animal, Routes.MEDICATION);
                                  break;
                                case AnimalMenuType.pregnancyDiagnosis:
                                  controller.goToNextPage(
                                      animal, Routes.PREGNANCY_DIAGNOSIS);
                                  break;
                                case AnimalMenuType.sale:
                                  controller.goToNextPage(animal, Routes.SALE);
                                  break;
                                case AnimalMenuType.acquisition:
                                  controller.goToNextPage(
                                      animal, Routes.PURCHASE);
                                  break;
                                default:
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                (animal.dead != null && animal.dead == true)
                                    ? []
                                    : _itemsPopMenu(),
                            child: CustomSlidable(
                              identity: index,
                              content: 'Identifier ${animal.identifier ?? ''}',
                              title:
                                  '${animal.id ?? index + 1} - ${animal.bornDate}',
                              icon: FontAwesomeIcons.cow,
                              onPressedEditCallBack: (BuildContext context) {
                                controller.goToForm(animal, index);
                              },
                              onPressedRemoveCallBack: (BuildContext context) {
                                controller.removeAnimal(animal);
                              },
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PopupMenuEntry<AnimalMenuType>> _itemsPopMenu() {
    return [
      PopupMenuItem<AnimalMenuType>(
        value: AnimalMenuType.insemination,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Inseminação',
              ),
            )
          ],
        ),
      ),
      PopupMenuItem<AnimalMenuType>(
        value: AnimalMenuType.mastitis,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Mastite',
              ),
            )
          ],
        ),
      ),
      PopupMenuItem<AnimalMenuType>(
        value: AnimalMenuType.disease,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Doenças',
              ),
            )
          ],
        ),
      ),
      PopupMenuItem<AnimalMenuType>(
        value: AnimalMenuType.medications,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Medicamentos',
              ),
            )
          ],
        ),
      ),
      PopupMenuItem<AnimalMenuType>(
        value: AnimalMenuType.pregnancyDiagnosis,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Prenhez',
              ),
            )
          ],
        ),
      ),
      PopupMenuItem<AnimalMenuType>(
        value: AnimalMenuType.sale,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Venda',
              ),
            )
          ],
        ),
      ),
      PopupMenuItem<AnimalMenuType>(
        value: AnimalMenuType.acquisition,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Compra',
              ),
            )
          ],
        ),
      ),
    ];
  }
}
