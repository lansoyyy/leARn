import 'package:flutter/material.dart';
import 'package:solar_mobile/utils/colors.dart';
import 'package:solar_mobile/widgets/button_widget.dart';

import 'home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-removebg-preview.png',
              height: 250,
            ),
            const SizedBox(
              height: 250,
            ),
            ButtonWidget(
              radius: 100,
              color: primary,
              label: 'Continue',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
