import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio_app/data/network/base_api_services.network.data.dart';
import 'package:portfolio_app/data/network/network_api_services.network.data.dart';
import 'package:portfolio_app/models/user_model.models.dart';
import 'package:portfolio_app/utils/app_constants.utils.dart';
import 'package:portfolio_app/utils/error_handle.utils.dart';
import 'package:portfolio_app/utils/utils.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  //register user
  Future<dynamic> userRegister(
      String name, String email, String password, BuildContext context) async {
    try {
      UserModel userModel = UserModel(
        id: "",
        name: name,
        email: email,
        password: password,
        address: "",
        token: "",
        type: "",
        cart: [],
      );

      dynamic response = await _apiServices.getPostApiResponse(
          AppConstants.SIGN_UP, userModel.toJson());

      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBarMessage(
              context,
              "Success",
              "Account created successfully ! Login with same credentials",
              ContentType.success,
            );
            print("successfull");
            print(response.body.toString());
          });
    } catch (e) {
      throw e.toString();
    }
  }
}
