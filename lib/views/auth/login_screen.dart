import 'package:flutter/material.dart';
import 'package:pretium/routes/routes.dart';
import 'package:pretium/utils/constants.dart';
import 'package:pretium/widgets/custom_button.dart';
import 'package:pretium/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kLightGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.account_balance_wallet_outlined,
                      color: kDarkGreen,
                      size: 35,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: kTitleFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Center(child: Text("Sign in to continue")),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: InputField(
                    isRequired: true,
                    hintText: "Email",
                    icon: Icons.email_outlined,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: InputField(
                    isEnabled: true,
                    hintText: "Password",
                    icon: Icons.lock_outline,
                    password: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: kDarkGreen,
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value ?? false;
                              });
                            },
                          ),
                          Text("Remember me"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: kDarkGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton(
                    callBackFunction: () {
                      Navigator.pushNamed(context, AppRoutes.navigation);
                    },
                    label: "Login",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: kDarkGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
