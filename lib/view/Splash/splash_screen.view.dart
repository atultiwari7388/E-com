import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/utils/text_style.utils.dart';
import '../../routes/app_router.routes.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 5), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 10),
      () => Get.toNamed(AppRouterHelper.getRegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            child: const SizedBox(
              height: 200.0,
              width: 200.0,
              child: Center(
                child: Image(
                  image: AssetImage("assets/logo2.png"),
                ),
              ),
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: _animationController.value * 2.0 * math.pi,
                child: child,
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Align(
            alignment: Alignment.center,
            child: Text("Welcome to E-com App",
                style: Styles.headlineTextStyle.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }
}
