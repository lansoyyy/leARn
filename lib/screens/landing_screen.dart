import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:solar_mobile/screens/admin_dashboard_screen.dart';
import 'package:solar_mobile/screens/admin_screen.dart';
import 'package:solar_mobile/services/add_login.dart';
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
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo-removebg-preview.png',
                height: 250,
              ),
              const SizedBox(
                height: 100,
              ),
              ButtonWidget(
                radius: 100,
                color: Colors.red[700],
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
                              color: Colors.red[700],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              addLogin(name.text);
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            name: name.text,
                                          )));
                            },
                            child: TextWidget(
                              text: 'Continue',
                              fontSize: 14,
                              color: Colors.red[700],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonWidget(
                radius: 100,
                color: Colors.red[700],
                label: 'Continue as Head',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFieldWidget(
                              color: primary,
                              hintColor: Colors.red,
                              controller: email,
                              label: 'Enter Email',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(
                              controller: password,
                              label: 'Enter Password',
                              showEye: true,
                              isObscure: true,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextWidget(
                              text: 'Close',
                              fontSize: 14,
                              color: Colors.red[700],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('Admin')
                                  .where('email', isEqualTo: email.text)
                                  .where('password', isEqualTo: password.text)
                                  .get()
                                  .then((QuerySnapshot querySnapshot) {
                                if (querySnapshot.docs.isNotEmpty) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdminDashboardScreen(
                                                name: querySnapshot
                                                    .docs.first['name'],
                                              )));
                                } else {
                                  Navigator.pop(context);
                                  showToast('Invalid account!');
                                  // No documents found
                                  print('No documents found.');
                                }
                              }).catchError((error) {
                                print('Error fetching documents: $error');
                              });
                            },
                            child: TextWidget(
                              text: 'Continue',
                              fontSize: 14,
                              color: Colors.red[700],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
