import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_animal_mastitis_type.dart';
import 'package:idr_mobile/app/modules/mastitis/form/mastitis_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/custom_radio.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class MastitisFormPage extends GetView<MastitisFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar mastite"),
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
                        maxLines: 1,
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
                          Text(
                            'Tipo de mastite',
                            style: UIConfig.textLabelStyle,
                          ),
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
                                        controller.mastitis
                                            .update((val) => val!.type = value);
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
                                        controller.mastitis
                                            .update((val) => val!.type = value);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resultado CMT',
                            style: UIConfig.textLabelStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              SizedBox(
                                width: 20,
                                child: Text(
                                  '+',
                                  style: UIConfig.textLabelBoldStyle,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                child: VerticalDivider(
                                  color: UIColors.blackColor24,
                                  thickness: 1,
                                  width: 1,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                child: Text(
                                  '++',
                                  style: UIConfig.textLabelBoldStyle,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                child: VerticalDivider(
                                  color: UIColors.blackColor24,
                                  thickness: 1,
                                  width: 1,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: Text(
                                  '+++',
                                  style: UIConfig.textLabelBoldStyle,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                child: VerticalDivider(
                                  color: UIColors.blackColor24,
                                  thickness: 1,
                                  width: 1,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: Text(
                                  'Ausente',
                                  style: UIConfig.textLabelBoldStyle,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 25,
                            child: Text(
                              'AD:',
                              style: UIConfig.textLabelStyle,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+',
                                groupValue: controller.resultCmtADGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtADGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ad = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '++',
                                groupValue: controller.resultCmtADGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtADGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ad = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+++',
                                groupValue: controller.resultCmtADGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtADGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ad = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Obx(
                              () => CustomRadio(
                                value: 'absent',
                                groupValue: controller.resultCmtADGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtADGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ad = value);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 25,
                            child: Text(
                              'AE:',
                              style: UIConfig.textLabelStyle,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+',
                                groupValue: controller.resultCmtAEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtAEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ae = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '++',
                                groupValue: controller.resultCmtAEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtAEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ae = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+++',
                                groupValue: controller.resultCmtAEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtAEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ae = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Obx(
                              () => CustomRadio(
                                value: 'absent',
                                groupValue: controller.resultCmtAEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtAEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.ae = value);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 25,
                            child: Text(
                              'PD:',
                              style: UIConfig.textLabelStyle,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+',
                                groupValue: controller.resultCmtPDGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPDGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pd = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '++',
                                groupValue: controller.resultCmtPDGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPDGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pd = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+++',
                                groupValue: controller.resultCmtPDGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPDGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pd = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Obx(
                              () => CustomRadio(
                                value: 'absent',
                                groupValue: controller.resultCmtPDGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPDGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pd = value);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 25,
                            child: Text(
                              'PE:',
                              style: UIConfig.textLabelStyle,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+',
                                groupValue: controller.resultCmtPEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pe = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '++',
                                groupValue: controller.resultCmtPEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pe = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Obx(
                              () => CustomRadio(
                                value: '+++',
                                groupValue: controller.resultCmtPEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pe = value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Obx(
                              () => CustomRadio(
                                value: 'absent',
                                groupValue: controller.resultCmtPEGroup.value,
                                onChanged: (value) {
                                  controller.resultCmtPEGroup.value = value!;
                                  controller.mastitis
                                      .update((val) => val!.pe = value);
                                },
                              ),
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
