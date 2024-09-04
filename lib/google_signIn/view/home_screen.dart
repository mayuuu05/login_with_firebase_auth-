import 'package:chat_app/google_signIn/services/google_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login_and_signup/services/auth_services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () async {

        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text('Home Page',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor:Colors.black
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFeb896e), Color(0xFF95cba4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Text(
                'Explore the app and enjoy!',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Spacing
              Expanded(
                child: GridView.count(
                  crossAxisCount: screenWidth > 600 ? 3 : 2,
                  crossAxisSpacing: screenWidth * 0.04,
                  mainAxisSpacing: screenHeight * 0.02,
                  children: [
                    buildCard(
                        screenWidth,
                        screenHeight,
                        Icons.home,
                        'Home'
                    ),
                    buildCard(
                        screenWidth,
                        screenHeight,
                        Icons.person,
                        'Profile'
                    ),
                    buildCard(
                        screenWidth,
                        screenHeight,
                        Icons.settings,
                        'Settings'
                    ),
                    buildCard(
                        screenWidth,
                        screenHeight,
                        Icons.info,
                        'About'
                    ),
                    InkWell(
                      onTap:() async {
                         await AuthService.authService.signOutYourAccount();
                        await GoogleAuthService.googleAuthService.signOutFromGoogle();
                        User? user = AuthService.authService.getCurrentUser();
                        if(user!=null)
                        {
                          Get.offAndToNamed('/');
                        }
                      } ,
                      child: buildCard(
                          screenWidth,
                          screenHeight,
                          Icons.login,
                          'LogOut'
                      ),
                    ),
                    buildCard(
                        screenWidth,
                        screenHeight,
                        Icons.help,
                        'Help'
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(double screenWidth, double screenHeight, IconData icon, String label) {
    return Card(
      color: Color(0xFFAF5044),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.07),
      ),
      elevation: screenWidth * 0.02,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: screenWidth * 0.12,
              color: Colors.white,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
