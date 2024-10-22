import 'dart:ui';

import 'package:chat/Sign%20In/UI/signin_ui.dart';
import 'package:chat/register/ui/signup_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../register/logic/register_cubit.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Stack(
        children: [
          const Positioned.fill(
            //
            child: Image(
              image: AssetImage('assets/Splash.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          const Positioned.fill(
            top: 60.0,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Connect                           '
                'friends                            '
                ' easily &                             '
                'quickly',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          Positioned.fill(
            top: 530.0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Our chat app is the perfect way to stay connected with friends and family.',
                style: TextStyle(
                    color: Colors.white70, fontSize: 19, fontFamily: 'Poppins'),
              ),
            ),
          ),
          Positioned.fill(
            top: 350,
            left: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<RegisterCubit>().registerWithGoogle();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xff3D4A7A)),
                    ),
                    child: Image.asset(
                      'assets/icons/google.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xff3D4A7A)),
                    ),
                    child: Image.asset(
                      'assets/icons/facebook.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xff3D4A7A)),
                    ),
                    child: Image.asset(
                      'assets/icons/icloud.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 780,
            bottom: 120,
            right: 30,
            left: 30,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupUi()));
              },
              child: Text(
                'Sign up withn mail',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFFF),
              ),
            ),
          ),
          Positioned.fill(
            top: 850,
            left: 120,
            child: Row(
              children: <Widget>[
                const Text(
                  'Existing account?',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Poppins', fontSize: 18),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SigninUi()));
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    ));
  }
}
