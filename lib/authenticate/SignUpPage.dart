// This is Sign Up page for user to register
import 'package:flutter/material.dart';
import 'package:fyp_application/HomePage.dart';
import 'package:fyp_application/authenticate/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:fyp_application/wrapper/wrapper.dart';
import 'package:fyp_application/services/auth.dart';



class SignUpPage extends StatefulWidget {

  final toggleView;
  const SignUpPage ({Key? key, this.toggleView}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

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
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0), 
              child: Form(
                key: _formKey, 
                child: Column(
                  children: [
                    //NAME 
                    TextFormField(
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter First Name and Last Name'),
                    ),
                    //POSITION
                    TextFormField(
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Position'),
                    ),
                    //EMAIL
                    TextFormField(
                      validator: (String? value) {
                    if (value!.isEmpty){
                      return "Email cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (val){
                  setState(() => email = val.trim());
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                    ),
                    //PASSWORD
                    TextFormField(
                      obscureText: true,
                validator: (String? value){
                    if(value!.length < 6){
                      return "Password >6 chars long";
                    }
                    return null;
                  },
                  onChanged: (val){
                    setState(() => password = val.trim());
                  },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                    ),

                  ],
                ),)),
            //Sign Up Button
            ElevatedButton(
               onPressed: () async{
                  /*Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));*/
                     if (_formKey.currentState!.validate()){
                       dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() => error = 'please supply a valid email');
                        }             
                     }
               },
                style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 130, 224, 170),), 
                child: Text(
                  'REGISTER',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            
           
            SizedBox(
              height: 20.0,
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

