import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:fastride/presentation/controller/login_screen_controller.dart';
import 'package:fastride/presentation/widgets/image_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Consumer<LoginScreenController>(
        builder: (context, loginState, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
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
                          obscureText: loginState.showPassword,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => loginState.setShowPassword(),
                                icon: loginState.showPassword == false
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              prefixIcon: const Icon(Icons.password),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.grey,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: MyColors.grey,
                              )),
                              hintText: "Password",
                              hintStyle: const TextStyle(color: MyColors.grey)),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, AppRoutes.forgetPasswordScreen),
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(color: MyColors.grey),
                              )),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: MyColors.white,
                                fontSize: 25,
                              ),
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
                          "Sign in with",
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
            const Text("Don't have an account?"),
            TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.registrationScreen),
                child: const Text(
                  "Signup",
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
