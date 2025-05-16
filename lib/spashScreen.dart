import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart';
import 'constants/variables.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // actual screen dimensions
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffFF939B),
                  Color(0xffEF2A39),
                  Color(0xFFEF2A39),
                ],
                stops: [0.0, 0.67, 1.0],
              ),
            ),
            child: Stack(
              children: [
                // Foodigo Text (centered)
                Positioned(
                  left: screenWidth * (129 / figmaWidth),
                  top: screenHeight * (282 / figmaHeight),
                  child: Text(
                    'Foodigo',
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: screenWidth * (-42 / figmaWidth),
                  top: screenHeight * (681 / figmaHeight),
                  child: Image.asset(
                    'images/splashScreen/image2.png',
                    width: screenWidth * (264 / figmaWidth),
                    height: screenHeight * (288 / figmaHeight),
                  ),
                ),
                Positioned(
                  top: screenHeight * (723 / figmaHeight),
                  left: screenWidth * (-26 / figmaWidth),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 100,
                      sigmaY: 100,
                    ), // Figma "Layer Blur: 10"
                    child: Container(
                      width: screenWidth * (57 / figmaWidth),
                      height: screenHeight * (237 / figmaHeight),
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * (798.5 / figmaHeight),
                  left: screenWidth * (149 / figmaWidth),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 21,
                      sigmaY: 21,
                    ), // Figma "Layer Blur: 10"
                    child: Container(
                      width: screenWidth * (42 / figmaWidth),
                      height: screenHeight * (137.5 / figmaHeight),
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * (924 / figmaHeight),
                  left: screenWidth * (222 / figmaWidth),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 14,
                      sigmaY: 14,
                    ), // Figma "Layer Blur: 10"
                    child: Container(
                      width: screenWidth * (108 / figmaWidth),
                      height: screenHeight * (12 / figmaHeight),
                      color: Colors.black,
                    ),
                  ),
                ),

                // Burger Image (Image 1)
                Positioned(
                  left: screenWidth * (134 / figmaWidth),
                  top: screenHeight * (758 / figmaHeight),
                  child: Image.asset(
                    'images/splashScreen/image1.png',
                    width: screenWidth * (202 / figmaWidth),
                    height: screenHeight * (202 / figmaHeight),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
