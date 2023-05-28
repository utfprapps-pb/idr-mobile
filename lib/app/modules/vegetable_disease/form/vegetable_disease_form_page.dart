import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/culture_model.dart';
import 'package:idr_mobile/app/data/models/disease_model.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/form/vegetable_disease_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_dropdown.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/custom_loading.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class VegetableDiseaseFormPage extends GetView<VegetableDiseaseFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar doença"),
      ),
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? customLoading
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomInputField(
                                      maxLines: 1,
                                      inputController:
                                          controller.propertyController,
                                      onTapCallBack: () {},
                                      isEnable: false,
                                      labelText: 'Propriedade',
                                      icon: Icons.agriculture_rounded,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Obx(
                                () => CustomDropdownButton<String>(
                                  label: "Tipo da infestação",
                                  items: controller.infestationTypeList,
                                  selectedValue: controller
                                      .infestationTypeSelected.value
                                      .toString(),
                                  onChanged: (String value) {
                                    controller.infestationTypeSelected.value =
                                        value;
                                    controller.vegetableDisease.update(
                                        (val) => val!.infestationType = value);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Obx(
                                () => CustomDropdownButton<CultureModel>(
                                  label: 'Cultura',
                                  items: controller.culturesFinal,
                                  selectedValue:
                                      controller.cultureSelected.value,
                                  onChanged: (CultureModel value) {
                                    controller.vegetableDisease.update(
                                        (val) => val!.idCulture = value.id);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Obx(
                                () => CustomDropdownButton<DiseaseModel>(
                                  label: 'Doença',
                                  items: controller.diseasesFinal,
                                  selectedValue:
                                      controller.diseaseSelected.value,
                                  onChanged: (DiseaseModel value) {
                                    controller.vegetableDisease.update(
                                        (val) => val!.idDisease = value.id);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomInputField(
                                maxLines: 1,
                                inputController: controller.dateController,
                                onTapCallBack: () =>
                                    controller.showCalendar(context),
                                onPressedIcon: () =>
                                    controller.showCalendar(context),
                                labelText: 'Data',
                                icon: Icons.calendar_today,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Obx(
                                () => CustomElevatedButton(
                                  title: '${controller.buttonText}',
                                  onPressedCallBack: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.onFormSubmit();
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
