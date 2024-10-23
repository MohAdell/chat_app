import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ForgetPassword/Ui/forget_password_screen.dart';
import '../../core/firebase/firebase_sevice.dart';
import '../../core/utils/routes.dart';
import '../logic/login_cubit.dart';

class SigninUi extends StatefulWidget {
  const SigninUi({super.key});

  @override
  State<SigninUi> createState() => _SigninUiState();
}

class _SigninUiState extends State<SigninUi> {
  late bool _passwordVisible = true;
  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(FirebaseService()),
        child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFeliuer) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errom),
                  backgroundColor: Colors.red,
                ));
                print('LoginFeliuer LoginFeliuer LoginFeliuer LoginFeliuer');
              }
              if (state is LoginSuces) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("succes"),
                  backgroundColor: Colors.green,
                ));
                print('LoginSuces LoginSuces LoginSuces LoginSuces LoginSuces');

                Navigator.pushReplacementNamed(context, Routes.homeScreen);
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xFFFFFFFF),
                  leading: BackButton(),
                ),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Form(
                      key: context.read<LoginCubit>().formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          Center(
                            child: Text(
                              'Log in to Chat+',
                              style: TextStyle(
                                  color: Color(0xff3D4A7A),
                                  fontSize: 33,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              'Welcome back!'
                              ' Sign in using your social account or email to continue us',
                              style: TextStyle(
                                  color: Color(0xff797C7B),
                                  fontSize: 14,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<LoginCubit>()
                                      .loginWithGoogle(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border:
                                        Border.all(color: Color(0xff3D4A7A)),
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
                                    border:
                                        Border.all(color: Color(0xff3D4A7A)),
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
                                    border:
                                        Border.all(color: Color(0xff3D4A7A)),
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
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                width: double.maxFinite,
                                height: 1,
                                color: Colors.black12,
                              )),
                              Text('   OR   ',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                  child: Container(
                                width: double.maxFinite,
                                height: 1,
                                color: Colors.black12,
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            controller: context.read<LoginCubit>().email,
                            decoration: const InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Your email',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: _passwordVisible,
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            controller: context.read<LoginCubit>().pass,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                  onPressed: _toggle,
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          GestureDetector(
                            onTap: () {
                              final formKey =
                                  context.read<LoginCubit>().formKey;
                              if (formKey.currentState != null &&
                                  formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(context);
                              }
                            },
                            child: Container(
                              height: 50.0,
                              width: 350,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black, Color(0xff3D4A7A)],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 19.0),
                                ),
                              ),
                            ),
                          ),
                          // BlocBuilder<LoginCubit, LoginState>(
                          //   builder: (context, state) {
                          //     if (state is LoginLoading) {
                          //       return const Center(
                          //           child: CircularProgressIndicator());
                          //     }
                          //     return TextButton(
                          //       onPressed: () {
                          //         final formKey =
                          //             context.read<LoginCubit>().formKey;
                          //         if (formKey.currentState != null &&
                          //             formKey.currentState!.validate()) {
                          //           context.read<LoginCubit>().login();
                          //         }
                          //       },
                          //       child: Container(
                          //         height: 50.0,
                          //         width: 350,
                          //         decoration: BoxDecoration(
                          //           gradient: LinearGradient(
                          //             begin: Alignment.centerLeft,
                          //             end: Alignment.centerRight,
                          //             colors: [Colors.black, Color(0xff3D4A7A)],
                          //           ),
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(10.0)),
                          //         ),
                          //         child: Center(
                          //           child: Text(
                          //             'Login',
                          //             style: TextStyle(
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Colors.white,
                          //                 fontFamily: 'Poppins',
                          //                 fontSize: 19.0),
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPasswordScreen()));
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3D4A7A),
                                    fontFamily: 'Poppins',
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                )))));
  }
}
