import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:solar_mobile/screens/admin_screen.dart';
import 'package:solar_mobile/utils/colors.dart';
import 'package:solar_mobile/widgets/button_widget.dart';
import 'package:solar_mobile/widgets/text_widget.dart';
import 'package:solar_mobile/widgets/textfield_widget.dart';
import 'package:solar_mobile/widgets/toast_widget.dart';

import 'home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final name = TextEditingController();
  final password = TextEditingController();

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
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 100,
                        child: TextFieldWidget(
                          controller: name,
                          label: 'Enter your Name',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: TextWidget(
                            text: 'Close',
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          name: name.text,
                                        )));
                          },
                          child: TextWidget(
                            text: 'Continue',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 100,
                        child: TextFieldWidget(
                          controller: password,
                          label: 'Enter Admin Password',
                          showEye: true,
                          isObscure: true,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: TextWidget(
                            text: 'Close',
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (password.text == 'admin123') {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AdminScreen()));
                            } else {
                              Navigator.pop(context);
                              showToast('Incorrect Password!');
                            }
                          },
                          child: TextWidget(
                            text: 'Continue',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: TextWidget(
                text: 'Continue as Admin',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
