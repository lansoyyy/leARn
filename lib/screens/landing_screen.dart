import 'package:flutter/material.dart';
import 'package:solar_mobile/utlis/colors.dart';
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8C52FF), Color(0xFFFF914D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/default_logo.png',
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
