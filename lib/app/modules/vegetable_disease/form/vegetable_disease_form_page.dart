import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable_disease/form/vegetable_disease_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_dropdown.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
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
        title: Text("Cadastrar doença vegetal"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              maxLines: 1,
                              inputController: controller.cultureController,
                              onTapCallBack: () {},
                              labelText: 'Cultura',
                              icon: Icons.grass_rounded,
                              onChanged: (_) => controller.vegetableDisease
                                  .update((val) => val!.culture = _),
                              // onValidate: (_) => controller.onValidate(_),
                              validator: (value) {
                                if (value == null ||
                                    value.toString().trim().isEmpty) {
                                  return "Campo não pode ser vazio";
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              maxLines: 1,
                              inputController:
                                  controller.diseaseIdentificationController,
                              onTapCallBack: () {},
                              labelText: 'Identificação da doença',
                              icon: Icons.coronavirus_outlined,
                              onChanged: (_) => controller.vegetableDisease
                                  .update(
                                      (val) => val!.diseaseIdentification = _),
                              // onValidate: (_) => controller.onValidate(_),
                              validator: (value) {
                                if (value == null ||
                                    value.toString().trim().isEmpty) {
                                  return "Campo não pode ser vazio";
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => CustomDropdownButton<String>(
                          label: "Forma da aplicação",
                          items: controller.typeInfectionList,
                          selectedValue: controller.typeInfection.toString(),
                          onChanged: (String value) {
                            controller.typeInfection.value = value;
                            controller.vegetableDisease
                                .update((val) => val!.typeInfection = value);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => CustomElevatedButton(
                          title: '${controller.buttonText}',
                          onPressedCallBack: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.onFormSubmit();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
