import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/models/breed_model.dart';
import 'package:idr_mobile/app/modules/vegetable_plague/form/vegetable_plague_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_dropdown.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/custom_loading.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class VegetablePlaguePageForm extends GetView<VegetablePlagueFormController> {
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
                              // const SizedBox(
                              //   height: 12,
                              // ),
                              // Obx(
                              //   () => CustomDropdownButton<BreedModel>(
                              //     items: controller.breedsFinal,
                              //     selectedValue: controller.breedSelected.value,
                              //     onChanged: (BreedModel value) {
                              //       controller.vegetablePlague.update((val) =>
                              //           val!.breed = value.id.toString());

                              //       print(controller.vegetablePlague.value);
                              //       print(controller.vegetablePlague.value);
                              //     },
                              //   ),
                              // ),

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
