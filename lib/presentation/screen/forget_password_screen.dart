import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:fastride/constant/validator.dart';

import 'package:fastride/presentation/controller/password_reset_screen_controller.dart';
import 'package:fastride/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return Scaffold(
      body: Consumer<PasswordResetScreenController>(
        builder: (context, controller, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/auth_image.png',
                          ),
                        ),
                        TextFormField(
                          validator: (text) =>
                              Validator.emailValidator(text: text!),
                          controller: email,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: MyColors.grey,
                              )),
                              hintText: "Email",
                              hintStyle: TextStyle(color: MyColors.grey)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onTap: () {
                            if (key.currentState!.validate()) {
                              controller.passwordReset(
                                  email: email.text, context: context);
                            }
                          },
                          child: controller.isLoading == true
                              ? const CircularProgressIndicator(
                                  color: MyColors.white,
                                )
                              : const Text(
                                  "Reset Password",
                                  style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 25,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.loginScreen),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: MyColors.primary,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
