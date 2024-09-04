import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/google_signIn/view/google_auth_manager.dart';
import 'package:chat_app/google_signIn/view/google_sign_in.dart';
import 'package:chat_app/google_signIn/view/google_sign_up.dart';
import 'package:chat_app/google_signIn/view/home_screen.dart';
import 'package:chat_app/google_signIn/view/introScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_and_signup/view/auth/auth_manager.dart';
import 'login_and_signup/view/auth/sign_in.dart';
import 'login_and_signup/view/auth/sign_up.dart';
import 'login_and_signup/view/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}


class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        //LOGIN AND SIGN UP
        // GetPage(name: '/', page: () => const AuthManager(),),
        // GetPage(name: '/signIn', page: () => const SignIn(),),
        // GetPage(name: '/signUp', page: () => const SignUp(),),
        // GetPage(name: '/home', page: () => const HomePage(),),

        // GOOGLE SIGNIN
        GetPage(name: '/', page: () =>  GoogleAuthManager(),),
        GetPage(name: '/signup', page: () =>  SignUpPage(),),
        GetPage(name: '/login', page: () =>  SignInPage(),),
        GetPage(name: '/home', page: () =>  HomeScreen(),),
      ],
    );
  }
}

