import 'package:fastride/constant/colors.dart';
import 'package:fastride/presentation/widgets/custom_btn.dart';
import 'package:fastride/presentation/widgets/image_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
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
                    const CustomButton(
                      child: Text(
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
