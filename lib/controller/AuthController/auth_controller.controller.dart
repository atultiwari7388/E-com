import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/repository/AuthRepo/auth_repo.repository.dart';
import 'package:portfolio_app/routes/app_router.routes.dart';

class AuthViewController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  final _authrepo = AuthRepository();

  //register user
  Future<void> createNewAccount(BuildContext context) async {
    isLoading = true;
    update();
    try {
      _authrepo
          .userRegister(
              nameController.text.toString(),
              emailController.text.toString(),
              passwordController.text.toString(),
              context)
          .then((value) {
        Get.toNamed(AppRouterHelper.getHomeScreen());
      }).onError((error, stackTrace) {
        print("error");
        print(error.toString());
        isLoading = false;
        update();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading = false;
      update();
    }
  }
}
