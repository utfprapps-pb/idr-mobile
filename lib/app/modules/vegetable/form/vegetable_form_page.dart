import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/vegetable/form/vegetable_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class VegetableFormPage extends GetView<VegetableFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar vegetables"),
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
                              onChanged: (_) => controller.vegetable
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
                        height: 20,
                      ),
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
