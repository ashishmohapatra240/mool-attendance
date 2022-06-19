import 'package:flutter/material.dart';
import 'package:mool_attendance/common/widgets/custom_button.dart';
import 'package:mool_attendance/common/widgets/custom_textfield.dart';
import 'package:mool_attendance/features/auth/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final TextEditingController _phonePANController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _signInFormKey = GlobalKey<FormState>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Login_Design.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 196,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    
                  ],
                ),
                const SizedBox(
                  height: 196,
                ),
                Form(
                    key: _signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _phonePANController,
                          hintText: 'Phone Number/PAN Number',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Enter your Password',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: const Text(
                            'Already have an account? Login',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff5E5F62),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(text: 'Sign Up', onTap: () async {})
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
