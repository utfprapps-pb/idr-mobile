import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/animal/animal_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class AnimalPageForm extends GetView<AnimalController> {
  final _formKey = GlobalKey<FormState>();

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
                  key: _formKey,
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
                              onSaved: (_) => controller.onSaved(_),
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
                              onSaved: (_) => controller.onSaved(_),
                              onChanged: (_) => controller.animal.update(
                                  (val) => val!.bornWeight = double.parse(_)),
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
                              icon: Icons.stars,
                              onSaved: (_) => controller.onSaved(_),
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
                              onSaved: (_) => controller.onSaved(_),
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
                              onSaved: (_) => controller.onSaved(_),
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
                              onSaved: (_) => controller.onSaved(_),
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
                              onSaved: (_) => controller.onSaved(_),
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
                      CustomElevatedButton(
                        title: 'Salvar',
                        onPressedCallBack: () =>
                            print(controller.animal.toJson()),
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
