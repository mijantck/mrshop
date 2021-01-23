import 'package:flutter/material.dart';
import 'package:mrshop/ui/views/homescreen.dart';
import 'package:mrshop/ui/widgets/welcomescreen2.dart';
import 'package:provider/provider.dart';
// import 'package:tassist/ui/widgets/welcomescreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tassist/ui/views/menu.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context);
    print(user);
    
    // return either the Home or Menu widget
    if (user == null){
      return HomeScreen();
    } else {
      return WelcomeScreen2();
    }
    
  }
}
