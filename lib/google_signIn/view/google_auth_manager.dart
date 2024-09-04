import 'package:chat_app/google_signIn/view/home_screen.dart';
import 'package:chat_app/google_signIn/view/introScreen.dart';


import 'package:flutter/material.dart';

import '../../login_and_signup/services/auth_services.dart';


class GoogleAuthManager extends StatelessWidget {
  const GoogleAuthManager({super.key});

  @override
  Widget build(BuildContext context) {
    return (AuthService.authService.getCurrentUser() == null)
        ?  IntroPage()
        :  HomeScreen();
  }
}
