import 'package:flutter/material.dart';

import 'login_screen.dart';

class CheckAuthStatusScreen extends StatelessWidget {
  const CheckAuthStatusScreen({super.key});

 /// Named route for [AuthScreen]
  static const String route = 'auth';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: Center(
        
      
        child: LoginScreen()
        

        
        ),
    );
  }
}
