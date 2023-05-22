import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/modules/login/login_controller.dart';
import 'package:idr_mobile/app/widgets/custom_elevated_button.dart';
import 'package:idr_mobile/app/widgets/custom_input_field.dart';
import 'package:idr_mobile/app/widgets/top_wave_custom_painter.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';
import 'package:idr_mobile/core/utils/functions/size_config.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SafeArea(
              child: TopWavesCustomPainter(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Login',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0059AA),
                            fontFamily: 'Segoe-UI',
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
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: CustomInputField(
                              maxLines: 1,
                              inputController: _usernameController,
                              onTapCallBack: () {},
                              labelText: 'Usuário',
                              icon: Icons.person,
                              validator: (username) {
                                if (username == null || username.isEmpty) {
                                  return "Digite seu usuário";
                                }

                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => CustomInputField(
                                maxLines: 1,
                                inputController: _passwordController,
                                onTapCallBack: () {},
                                onPressedIcon: () =>
                                    controller.onChangedObscureText(),
                                isObscureText: controller.isObscureText.value,
                                labelText: 'Senha',
                                icon: controller.isObscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                validator: (password) {
                                  if (password == null ||
                                      password.toString().trim().isEmpty) {
                                    return "Digite sua senha";
                                  }

                                  return null;
                                },
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 16, left: 16, bottom: 16, top: 32),
                  child: SizedBox(
                    height: 48,
                    child: Obx(
                      () => controller.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: UIColors.primaryColor,
                              ),
                            )
                          : CustomElevatedButton(
                              onPressedCallBack: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.signIn(
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  );
                                }
                              },
                              title: 'Login',
                            ),
                    ),
                  ),
                ),
              ),
            )
            // ),
          ],
        ),
      ),
    );
  }
}
