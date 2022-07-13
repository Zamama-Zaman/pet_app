import 'package:fido_mingle/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashLogic logic = Get.put(SplashLogic());
  final SplashState state = Get.find<SplashLogic>().state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(PageRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            ///---background-image
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/splash_background-4.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            ///---transparency
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/splash_overlay.png',
                fit: BoxFit.fill,
              ),
            ),

            ///---circles
            Positioned(
                right: 0,
                top: MediaQuery.of(context).size.height * .05,
                child: SvgPicture.asset(
                  'assets/splash_circles.svg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .7,
                )),

            ///---bottom
            Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/splash_bottom.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .5,
                )),

            ///---logo
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: SvgPicture.asset(
                  'assets/splash_logo.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
