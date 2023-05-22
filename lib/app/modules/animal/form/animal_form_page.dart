import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/modules/animal/animal_controller.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_dropdown.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class AnimalPageForm extends GetView<AnimalFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar animais"),
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
                              inputController: controller.nameController,
                              onTapCallBack: () {},
                              labelText: 'Nome',
                              icon: Icons.text_fields_rounded,
                              onChanged: (_) => controller.animal
                                  .update((val) => val!.name = _),
                              // onValidate: (_) => controller.onValidate(_),
                              // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
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
                              inputController: controller.bornWeightdController,
                              onTapCallBack: () {},
                              keyboardType: TextInputType.number,
                              labelText: 'Peso nascido',
                              icon: Icons.balance_rounded,
                              onChanged: (_) => controller.animal.update(
                                  (val) => val!.bornWeight =
                                      _ != "" ? double.parse(_) : null),

                              // onValidate: (_) => controller.onValidate(_),
                              // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
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
                              inputController: controller.breedController,
                              onTapCallBack: () {},
                              labelText: 'Raça',
                              icon: Icons.auto_awesome,
                              onChanged: (_) => controller.animal
                                  .update((val) => val!.breed = _),
                              // onValidate: (_) => controller.onValidate(_),
                              // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
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
                              inputController: controller.eccController,
                              onTapCallBack: () {},
                              labelText: 'Ecc',
                              keyboardType: TextInputType.number,
                              icon: Icons.eco,
                              onChanged: (_) => controller.animal
                                  .update((val) => val!.ecc = double.parse(_)),
                              // onValidate: (_) => controller.onValidate(_),
                              // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
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
                                  controller.currentWeightController,
                              onTapCallBack: () {},
                              labelText: 'Peso atual',
                              keyboardType: TextInputType.number,
                              icon: Icons.balance_rounded,
                              onChanged: (_) => controller.animal.update(
                                  (val) =>
                                      val!.currentWeight = double.parse(_)),
                              // onValidate: (_) => controller.onValidate(_),
                              // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
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
                              inputController: controller.identifierController,
                              onTapCallBack: () {},
                              labelText: 'Identificador',
                              keyboardType: TextInputType.text,
                              icon: Icons.fingerprint_outlined,
                              onChanged: (_) => controller.animal
                                  .update((val) => val!.identifier = _),
                              // onValidate: (_) => controller.onValidate(_),
                              // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomInputField(
                        maxLines: 1,
                        inputController: controller.bornDateController,
                        onTapCallBack: () =>
                            controller.showCalendar(context, 'born'),
                        onPressedIcon: () =>
                            controller.showCalendar(context, 'born'),
                        labelText: 'Data nascimento',
                        icon: Icons.calendar_today,
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
                                  controller.previousWeightController,
                              onTapCallBack: () {},
                              labelText: 'Peso previsto',
                              keyboardType: TextInputType.number,
                              icon: Icons.balance_rounded,
                              onChanged: (_) => controller.animal.update(
                                  (val) =>
                                      val!.previousWeight = double.parse(_)),
                              // onValidate: (_) => controller.onValidate(_),
                              // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                                activeColor: UIColors.primaryColor,
                                value: controller.isBornInProperty.value,
                                onChanged: (value) {
                                  controller.isBornInProperty.value = value!;
                                  controller.animal.update(
                                    (val) => val!.bornInProperty = value,
                                  );
                                }),
                          ),
                          Text('Nascido na propriedade?')
                        ],
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.isBornInProperty.value,
                          child: const SizedBox(
                            height: 12,
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.isBornInProperty.value,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomInputField(
                                  maxLines: 1,
                                  inputController:
                                      controller.cowIdentifierController,
                                  onTapCallBack: () {},
                                  labelText: 'Identificar animal',
                                  keyboardType: TextInputType.number,
                                  icon: Icons.pets_rounded,
                                  onChanged: (_) => controller.animal.update(
                                    (val) => val!.cowIdentifier = _,
                                  ),
                                  // onValidate: (_) => controller.onValidate(_),
                                  // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),
                      // CustomDropdownButton<String>(
                      //   items: controller.propertiesStringList,
                      //   selectedValue: controller.selectedProperty.toString(),
                      //   onChanged: (String newValue) {
                      //     controller.selectedProperty.value = newValue;
                      //     controller.animal.update(
                      //       (val) => val!.propertyId = int.parse(
                      //           newValue.replaceAll('Propriedade', '').trim()),
                      //     );
                      //     controller.onSaved(newValue);
                      //   },
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              maxLines: 1,
                              inputController: controller.propertyController,
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
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                                activeColor: UIColors.primaryColor,
                                value: controller.isDead.value,
                                onChanged: (value) {
                                  controller.isDead.value = value!;
                                  controller.animal.update(
                                    (val) => val!.dead = value,
                                  );
                                }),
                          ),
                          Text('Morreu?')
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.isDead.value,
                          child: CustomInputField(
                            maxLines: 1,
                            inputController: controller.deadDateController,
                            onTapCallBack: () =>
                                controller.showCalendar(context, 'dead'),
                            onPressedIcon: () =>
                                controller.showCalendar(context, 'dead'),
                            labelText: 'Data morte',
                            icon: Icons.calendar_today,
                          ),
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
    );
  }
}
