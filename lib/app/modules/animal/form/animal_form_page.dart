import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/app/modules/animal/animal_controller.dart';
import 'package:idr_mobile/app/modules/animal/form/animal_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_dropdown.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/custom_loading.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';

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
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomInputField(
                                      maxLines: 1,
                                      inputController:
                                          controller.nameController,
                                      onTapCallBack: () {},
                                      labelText: 'Nome',
                                      icon: FontAwesomeIcons.signature,
                                      onChanged: (_) => controller.animal
                                          .update((val) => val!.name = _),
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
                                            controller.bornWeightController,
                                        onTapCallBack: () {},
                                        keyboardType: TextInputType.number,
                                        labelText: 'Peso nascido',
                                        icon: Icons.balance_rounded,
                                        onChanged: (_) {
                                          if (_.toString().trim().isNotEmpty) {
                                            controller.animal.update((val) =>
                                                val!.bornWeight = _ != ""
                                                    ? double.parse(_)
                                                    : null);
                                          }
                                        }

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
                                      onChanged: (_) {
                                        if (_.toString().trim().isNotEmpty) {
                                          controller.animal.update((val) => val!
                                              .currentWeight = double.parse(_));
                                        }
                                      },
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
                                          controller.previousWeightController,
                                      onTapCallBack: () {},
                                      labelText: 'Peso previsto',
                                      keyboardType: TextInputType.number,
                                      icon: Icons.balance_rounded,
                                      onChanged: (_) {
                                        if (_.toString().trim().isNotEmpty) {
                                          controller.animal.update((val) =>
                                              val!.previousWeight =
                                                  double.parse(_));
                                        }
                                      },
                                      // onValidate: (_) => controller.onValidate(_),
                                      // validator: (_) => GetUtils.isNull(_) ? null : 'Insira um valor',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Obx(
                                () => CustomDropdownButton<BreedModel>(
                                  items: controller.breedsFinal,
                                  label: 'Raça',
                                  selectedValue: controller.breedSelected.value,
                                  onChanged: (BreedModel value) {
                                    controller.animal.update((val) =>
                                        val!.breed = value.id.toString());
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Obx(
                                () => CustomDropdownButton<String>(
                                  label: "Gênero",
                                  items: controller.genderTypeList,
                                  selectedValue: controller
                                      .genderTypeSelected.value
                                      .toString(),
                                  onChanged: (String value) {
                                    controller.genderTypeSelected.value = value;
                                    controller.animal
                                        .update((val) => val!.gender = value);
                                  },
                                ),
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
                                          controller.typeController,
                                      onTapCallBack: () {},
                                      labelText: 'Tipo',
                                      keyboardType: TextInputType.text,
                                      icon: Icons.balance_rounded,
                                      onChanged: (_) => controller.animal
                                          .update((val) => val!.type = _),
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
                                      inputController: controller.eccController,
                                      onTapCallBack: () {},
                                      labelText: 'Ecc',
                                      keyboardType: TextInputType.number,
                                      icon: Icons.eco,
                                      onChanged: (_) => controller.animal
                                          .update((val) =>
                                              val!.ecc = double.parse(_)),
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
                                          controller.identifierController,
                                      onTapCallBack: () {},
                                      labelText: 'Identificador',
                                      keyboardType: TextInputType.text,
                                      icon: Icons.fingerprint_outlined,
                                      onChanged: (_) => controller.animal
                                          .update((val) => val!.identifier = _),
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
                                  Obx(
                                    () => Checkbox(
                                        activeColor: UIColors.primaryColor,
                                        value:
                                            controller.isBornInProperty.value,
                                        onChanged: (value) {
                                          controller.isBornInProperty.value =
                                              value!;
                                          controller.animal.update(
                                            (val) =>
                                                val!.bornInProperty = value,
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
                                          inputController: controller
                                              .animalMotherIdentifierController,
                                          onTapCallBack: () {},
                                          labelText: 'Identificar animal mãe',
                                          keyboardType: TextInputType.number,
                                          icon: Icons.pets_rounded,
                                          onChanged: (_) =>
                                              controller.animal.update(
                                            (val) =>
                                                val!.animalMotherIdentifier = _,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value
                                                    .toString()
                                                    .trim()
                                                    .isEmpty) {
                                              return "Campo não pode ser vazio";
                                            }

                                            return null;
                                          },
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
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                        activeColor: UIColors.primaryColor,
                                        value: controller.isDead.value,
                                        onChanged: (value) {
                                          controller.isDead.value = value!;
                                          controller.animal.update((val) {
                                            val!.dead = value;
                                            val.deadDate = dateFormat
                                                .format(DateTime.now());
                                          });
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
                                    inputController:
                                        controller.deadDateController,
                                    onTapCallBack: () => controller
                                        .showCalendar(context, 'dead'),
                                    onPressedIcon: () => controller
                                        .showCalendar(context, 'dead'),
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
