import 'package:flutter/material.dart';
import 'package:fyp_application/HomePage.dart';
import 'package:fyp_application/authenticate/authenticate.dart';
import 'package:fyp_application/listview.dart';
import 'package:provider/provider.dart';
import 'package:fyp_application/models/myuser.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final user = Provider.of<MyUser?>(context);
    print(user);

    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    }else{
      return HomePage();
    }
  }
}