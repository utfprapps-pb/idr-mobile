import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/insemination/form/insemination_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class InseminationPageForm extends GetView<InseminationFormController> {
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              maxLines: 1,
                              inputController: controller.bullController,
                              onTapCallBack: () {},
                              labelText: 'Touro',
                              icon: Icons.qr_code_2_rounded,
                              onChanged: (_) => controller.insemination
                                  .update((val) => val!.bull = _),
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
                        inputController: controller.dateController,
                        onTapCallBack: () => controller.showCalendar(context),
                        onPressedIcon: () => controller.showCalendar(context),
                        labelText: 'Data Inseminação',
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
