import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idr_mobile/app/data/models/product_model.dart';
import 'package:idr_mobile/app/modules/medication/form/medication_form_controller.dart';
import 'package:idr_mobile/app/widgets/custom_dropdown.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/custom_loading.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';
import 'package:dropdown_search/dropdown_search.dart';

class MedicationFormPage extends GetView<MedicationFormController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: UIColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar uso de medicamento"),
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
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CustomInputField(
                                maxLines: 1,
                                inputController:
                                    controller.applicationDateController,
                                onTapCallBack: () =>
                                    controller.showCalendar(context),
                                onPressedIcon: () =>
                                    controller.showCalendar(context),
                                labelText: 'Data aplicação',
                                icon: Icons.calendar_today,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomInputField(
                                      inputController:
                                          controller.appliedDoseController,
                                      onTapCallBack: () {},
                                      labelText: 'Dose aplicada',
                                      icon: Icons.vaccines_rounded,
                                      onChanged: (_) => controller.medication
                                          .update(
                                              (val) => val!.appliedDose = _),
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
                                  label: "Forma da aplicação",
                                  items: controller.applicationWaysList,
                                  selectedValue:
                                      controller.applicationWay.toString(),
                                  onChanged: (String value) {
                                    controller.applicationWay.value = value;
                                    controller.medication.update(
                                        (val) => val!.applicationWay = value);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Obx(() =>
                                        DropdownSearch<ProductModel>(
                                          items: controller.productsFinal,
                                          popupProps: PopupPropsMultiSelection
                                              .modalBottomSheet(
                                            showSelectedItems: true,
                                            itemBuilder:
                                                _customPopupItemBuilderExample2,
                                            showSearchBox: true,
                                          ),
                                          compareFn: (item, sItem) =>
                                              item.id == sItem.id,
                                          selectedItem:
                                              controller.productSelected.value,
                                          onChanged: (value) {
                                            controller.productSelected.value =
                                                value!;
                                            controller.medication.update((val) {
                                              val!.idProduct = value.id;
                                              val.activePrinciple =
                                                  value.activePrincipleName;
                                            });
                                            controller.activePrincipleController
                                                    .text =
                                                value.activePrincipleName
                                                    .toString();
                                          },
                                          itemAsString: (item) =>
                                              item.toString(),
                                          dropdownDecoratorProps:
                                              DropDownDecoratorProps(
                                            dropdownSearchDecoration:
                                                InputDecoration(
                                              labelText: 'Produto (remédio)',
                                              filled: true,
                                              fillColor: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .fillColor,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                  color: UIColors.primaryColor,
                                                  width: 2,
                                                  strokeAlign: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
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
                                      inputController:
                                          controller.activePrincipleController,
                                      onTapCallBack: () {},
                                      labelText: 'Princípio ativo',
                                      icon: Icons.medical_information_rounded,
                                      onChanged: (_) => controller.medication
                                          .update((val) =>
                                              val!.activePrinciple = _),
                                      // onValidate: (_) => controller.onValidate(_),
                                      isEnable: false,
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
                                    if (formKey.currentState!.validate()) {
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
      ),
    );
  }
}

Widget _customPopupItemBuilderExample2(
    BuildContext context, ProductModel product, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
        selected: isSelected,
        title: Text(product.name.toString()),
        subtitle: Text(product.description.toString()),
        leading: Icon(Icons.medication)),
  );
}
