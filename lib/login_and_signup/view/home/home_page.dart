
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Home Page',style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
       actions: [
         IconButton(onPressed: () async {
           await AuthService.authService.signOutYourAccount();
           User? user = AuthService.authService.getCurrentUser();
           if(user == null)
             {
               Get.offAndToNamed('/signIn');
             }
         }, icon: Icon(Icons.login,color: Colors.white,)),
       ],
      ),
      

    );
  }
}
