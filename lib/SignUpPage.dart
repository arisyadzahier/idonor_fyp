// This is Sign Up page for user to register
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Color.fromARGB(255, 130, 224, 170),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset(
                      'assets/images/FYP_logo.png',
                      height: 150,
                      width: 200,
                      fit: BoxFit.fitWidth,)),
              ),
            ),

            // name, position, email, password, confirm password
            Padding(
             // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter First Name and Last Name'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Position'),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter same password'),
              ),
            ),
            
            SizedBox(
              height: 10,
            ),

            //Sign Up Button
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 130, 224, 170), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // Sign In button
             /* Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, 
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
              ),
            ),*/

            SizedBox(
              height: 20,
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
              }, 
              child:
            Text('Already has account? Sign In'
            ),
            ),
          ],
        ),
      ),
    );
  }
}

