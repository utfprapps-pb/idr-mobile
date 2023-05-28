import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/pregnancy_diagnosis/form/pregnancy_diagnosis_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class PregnancyDiagnosisFormPage
    extends GetView<PregnancyDiagnosisFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar Diagnóstico de Prenhez"),
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
                        onTapCallBack: () => controller.showCalendar(
                            context, controller.dateController, 'date'),
                        onPressedIcon: () => controller.showCalendar(
                            context, controller.dateController, 'date'),
                        labelText: 'Data diagnóstico',
                        icon: Icons.calendar_today,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomInputField(
                        maxLines: 1,
                        inputController:
                            controller.dateLastInseminationController,
                        onTapCallBack: () => controller.showCalendar(
                            context,
                            controller.dateLastInseminationController,
                            'dateLast'),
                        onPressedIcon: () => controller.showCalendar(
                            context,
                            controller.dateLastInseminationController,
                            'dateLast'),
                        labelText: 'Data ultima diagnóstico de prenhez',
                        icon: Icons.calendar_today,
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
