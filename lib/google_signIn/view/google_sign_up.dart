import 'package:chat_app/google_signIn/services/google_auth_services.dart';
import 'package:chat_app/login_and_signup/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFeb896e), Color(0xFF95cba4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFeb896e), Color(0xFF95cba4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.3),
                  bottomRight: Radius.circular(screenWidth * 0.3),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(screenWidth * 0.08)),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFAF5044),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        labelText: 'E-mail address',
                        labelStyle: TextStyle(color: Colors.black54, fontSize: screenWidth * 0.045),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          borderSide: BorderSide(color: Colors.black54, width: screenWidth * 0.002),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          borderSide: BorderSide(color: Colors.black54, width: screenWidth * 0.002),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    TextField(

                      cursorColor: Colors.grey,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black54, fontSize: screenWidth * 0.045),
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.black54, size: screenWidth * 0.05),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          borderSide: BorderSide(color: Colors.black54, width: screenWidth * 0.002),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          borderSide: BorderSide(color: Colors.black54, width: screenWidth * 0.002),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    TextField(
                      cursorColor: Colors.grey,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: TextStyle(color: Colors.black54, fontSize: screenWidth * 0.045),
                        suffixIcon: Icon(Icons.visibility_off, color: Colors.black54, size: screenWidth * 0.05),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          borderSide: BorderSide(color: Colors.black54, width: screenWidth * 0.002),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                          borderSide: BorderSide(color: Colors.black54, width: screenWidth * 0.002),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: Color(0xFFAF5044),
                        ),
                        Text(
                          'I accept the terms & conditions',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFAF5044),
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    Center(
                      child: Text(
                        'or sign up with',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    Center(
                      child: SignInButton(Buttons.google, onPressed: () async {
                        await GoogleAuthService.googleAuthService.signInWithGoogle();
                        User? user = AuthService.authService.getCurrentUser();
                        if(user!=null)
                          {
                            Get.offAndToNamed('/home');
                          }

                      }),
                    ),
                    SizedBox(width: screenWidth * 0.05),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
