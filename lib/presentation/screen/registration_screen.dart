import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/validator.dart';
import 'package:fastride/domain/user_model.dart';
import 'package:fastride/presentation/controller/registration_screen_controller.dart';
import 'package:fastride/presentation/widgets/custom_alert_widget.dart';
import 'package:fastride/presentation/widgets/custom_btn.dart';
import 'package:fastride/presentation/widgets/image_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController fullName = TextEditingController();
    return Scaffold(
      body: Consumer<RegistrationScreenController>(
        builder: (context, registrationController, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
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
                              Validator.nameValidator(text: text!),
                          controller: fullName,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.grey,
                                ),
                              ),
                              hintText: "Full Name",
                              hintStyle: TextStyle(color: MyColors.grey)),
                        ),
                        const SizedBox(
                          height: 20,
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
                        TextFormField(
                          validator: (text) =>
                              Validator.phoneValidator(text: text!),
                          controller: phoneNumber,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.call),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: MyColors.grey,
                              )),
                              hintText: "Phone",
                              hintStyle: TextStyle(color: MyColors.grey)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (text) =>
                              Validator.passwordValidator(text: text!),
                          controller: password,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: MyColors.grey,
                              )),
                              hintText: "Password",
                              hintStyle: TextStyle(color: MyColors.grey)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onTap: () {
                            if (key.currentState!.validate()) {
                              UserModel userModel = UserModel(
                                  email: email.text,
                                  password: password.text,
                                  phoneNumber: phoneNumber.text,
                                  fullName: fullName.text);
                              registrationController.registerUser(
                                userModel: userModel,
                                context: context,
                              );
                            }
                          },
                          child: registrationController.isLoading == true
                              ? const CircularProgressIndicator(
                                  color: MyColors.white,
                                )
                              : const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 25,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Sign up with",
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageButton(
                              image: 'assets/images/facebook.png',
                              onClick: () {},
                            ),
                            const SizedBox(width: 20),
                            ImageButton(
                              image: 'assets/images/google.png',
                              onClick: () {},
                            ),
                            const SizedBox(width: 20),
                            ImageButton(
                              image: 'assets/images/x.png',
                              onClick: () {},
                            ),
                          ],
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
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Signin",
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

void resultDialogue(
    {required BuildContext context,
    required String image,
    required String message}) async {
  await showDialog(
    context: context,
    builder: (context) => CustomAlertWidget(
      image: image,
      message: message,
      onTap: () => Navigator.pop(context),
    ),
  );
}
