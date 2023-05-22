import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_mastitis_type.dart';
import 'package:idr_mobile/app/modules/mastitis/form/mastitis_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class MastitisFormPage extends GetView<MastitisFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar inseminação"),
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
                        height: 12,
                      ),
                      CustomInputField(
                        inputController: controller.dateController,
                        onTapCallBack: () => controller.showCalendar(context),
                        onPressedIcon: () => controller.showCalendar(context),
                        labelText: 'Data Diagnóstico',
                        icon: Icons.calendar_today,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tipo de mastite'),
                          Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Clínica"),
                                    leading: Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => UIColors.primaryColor),
                                      value: AnimalMastitisType.clinic.name,
                                      groupValue: controller.typeMastitis.value,
                                      onChanged: (String? value) {
                                        controller.typeMastitis.value = value!;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Obx(
                                  () => ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Sub-Clínica"),
                                    leading: Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => UIColors.primaryColor),
                                      value: AnimalMastitisType.subClinic.name,
                                      groupValue: controller.typeMastitis.value,
                                      onChanged: (String? value) {
                                        controller.typeMastitis.value = value!;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              inputController: controller.cmtController,
                              onTapCallBack: () {},
                              labelText: 'CMT',
                              icon: Icons.more,
                              onChanged: (_) => controller.mastitis
                                  .update((val) => val!.resultCmt = _),
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
                              inputController: controller.adController,
                              onTapCallBack: () {},
                              labelText: 'AD',
                              onChanged: (_) => controller.mastitis
                                  .update((val) => val!.ad = _),
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
                              inputController: controller.aeController,
                              onTapCallBack: () {},
                              labelText: 'AE',
                              onChanged: (_) => controller.mastitis
                                  .update((val) => val!.ae = _),
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
                              inputController: controller.pdController,
                              onTapCallBack: () {},
                              labelText: 'PD',
                              onChanged: (_) => controller.mastitis
                                  .update((val) => val!.pd = _),
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
                              inputController: controller.peController,
                              onTapCallBack: () {},
                              labelText: 'PE',
                              onChanged: (_) => controller.mastitis
                                  .update((val) => val!.pe = _),
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
