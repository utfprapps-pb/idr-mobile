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
                        inputController: controller.bornDateController,
                        onTapCallBack: () => controller.showCalendar(context),
                        onPressedIcon: () => controller.showCalendar(context),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: UIColors.primaryColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Obx(
                            () => DropdownButton<String>(
                              value: controller.selectedProperty.value,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: UIColors.primaryColor,
                              ),
                              iconSize: 24.0,
                              elevation: 16,
                              style: TextStyle(
                                color: UIColors.primaryColor,
                                fontSize: 16.0,
                              ),
                              isExpanded: true,
                              alignment: Alignment.centerRight,
                              // onChanged: onChanged(newObject()),
                              onChanged: (newValue) =>
                                  controller.onChangedDropdown(newValue),
                              items: controller.propertiesStringList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: UIColors.primaryColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),
                      CustomElevatedButton(
                        title: 'Salvar',
                        onPressedCallBack: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.onFormSubmit();
                          }
                        },
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
