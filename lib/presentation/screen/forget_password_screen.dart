import 'package:fastride/constant/colors.dart';
import 'package:fastride/constant/routes.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          "Reset Password",
                          style: TextStyle(
                            color: MyColors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
