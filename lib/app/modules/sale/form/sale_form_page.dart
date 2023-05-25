import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/sale/form/sale_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_dropdown.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class SaleFormPage extends GetView<SaleFormController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registrar venda"),
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
                            context, controller.dateController),
                        onPressedIcon: () => controller.showCalendar(
                            context, controller.dateController),
                        labelText: 'Data venda',
                        icon: Icons.calendar_today,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => CustomDropdownButton<String>(
                          label: "Motivo da venda",
                          items: controller.reasonsList,
                          selectedValue:
                              controller.reasonSaleSelected.toString(),
                          onChanged: (String value) {
                            controller.reasonSaleSelected.value = value;
                            controller.sale
                                .update((val) => val!.reason = value);
                          },
                        ),
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
                                  controller.sale.update(
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
                              labelText: 'Valor recebido',
                              keyboardType: TextInputType.number,
                              icon: Icons.attach_money_rounded,
                              onChanged: (_) => controller.sale.update(
                                  (val) => val!.value = double.parse(_)),
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
                        () => CustomDropdownButton<String>(
                          label: "Destino",
                          items: controller.destinationsList,
                          selectedValue: controller.destinySelected.toString(),
                          onChanged: (String value) {
                            controller.destinySelected.value = value;
                            controller.sale
                                .update((val) => val!.destiny = value);
                          },
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
