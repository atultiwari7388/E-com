import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/routes/app_router.routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-com',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouterHelper.splashScreen,
      getPages: AppRouterHelper.routes,
    );
  }
}
