import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/controller/AuthController/auth_controller.controller.dart';
import 'package:portfolio_app/models/user_model.models.dart';
import '../../resources/widgets/custom_button.widgets.dart';
import '../../resources/widgets/custom_text_filed.widgets.dart';
import '../../utils/color.utils.dart';

class RegisterUser extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final loginController = Get.put(AuthViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthViewController>(
        init: AuthViewController(),
        builder: (value) {
          if (value.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                //logo
                Expanded(child: Container()),
                Expanded(
                  flex: 3,
                  child: Form(
                    key: value.signUpFormKey,
                    child: Column(
                      children: [
                        //form
                        Text(
                          "Sign Up",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: defaultPadding * 2),
                        CustomTextField(
                          controller: value.nameController,
                          svgImageColor: kPrimaryColor,
                          hintText: 'Name',
                          imagePath: 'assets/icons/person.svg',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: value.emailController,
                          svgImageColor: kPrimaryColor,
                          hintText: 'Email',
                          imagePath: 'assets/icons/email.svg',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: value.passwordController,
                          svgImageColor: kPrimaryColor,
                          hintText: 'Password',
                          imagePath: 'assets/icons/password.svg',
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: defaultPadding * 2),

                        TextButton(
                          onPressed: () {
                            if (value.signUpFormKey.currentState!.validate()) {
                              loginController.createNewAccount(context);
                            }
                          },
                          child: Text("Sign up"),
                        ),

                        // CustomButton(
                        //   text: "Sign Up",
                        //   onTap: () {
                        //     if (value.signUpFormKey.currentState!.validate()) {
                        //       loginController.createNewAccount(
                        //         UserModel(
                        //           id: "",
                        //           name: value.nameController.text.toString(),
                        //           email: value.emailController.text.toString(),
                        //           password:
                        //               value.passwordController.text.toString(),
                        //           address: "",
                        //           token: "",
                        //           type: "",
                        //           cart: [],
                        //         ),
                        //       );
                        //     }
                        //   },
                        // ),
                        SizedBox(height: defaultPadding * 2),
                        GestureDetector(
                          onTap: () {},
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black54),
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: kPrimaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
