import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/purchase/form/purchase_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class PurchaseFormPage extends GetView<PurchaseFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registrar compra"),
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
                        inputController: controller.datePurchaseController,
                        onTapCallBack: () => controller.showCalendar(context,
                            controller.datePurchaseController, 'purchase'),
                        onPressedIcon: () => controller.showCalendar(context,
                            controller.datePurchaseController, 'purchase'),
                        labelText: 'Data da compra',
                        icon: Icons.calendar_today,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomInputField(
                        maxLines: 1,
                        inputController: controller.dateBirthController,
                        onTapCallBack: () => controller.showCalendar(
                            context, controller.dateBirthController, 'birth'),
                        onPressedIcon: () => controller.showCalendar(
                            context, controller.dateBirthController, 'birth'),
                        labelText: 'Data do nascimento',
                        icon: Icons.calendar_today,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              inputController: controller.weightController,
                              onTapCallBack: () {},
                              labelText: 'Peso do animal',
                              icon: Icons.balance_rounded,
                              keyboardType: TextInputType.number,
                              onChanged: (_) {
                                if (_.toString().trim().isNotEmpty) {
                                  controller.purchase.update(
                                      (val) => val!.weight = double.parse(_));
                                }
                              },
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
                              inputController: controller.valueController,
                              onTapCallBack: () {},
                              labelText: 'Valor Pago',
                              keyboardType: TextInputType.number,
                              icon: Icons.attach_money_rounded,
                              onChanged: (_) {
                                if (_.toString().trim().isNotEmpty) {
                                  controller.purchase.update(
                                      (val) => val!.value = double.parse(_));
                                }
                              },
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
