import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:fyp_application/services/auth.dart';
import 'package:fyp_application/wrapper/wrapper.dart';
import 'package:fyp_application/services/auth.dart';
import 'package:fyp_application/HomePage.dart';
import 'package:fyp_application/authenticate/SignUpPage.dart';
import 'package:fyp_application/main.dart';
import 'package:fyp_application/shared/loading.dart';

class LoginPage extends StatefulWidget {

  final toggleView;
  const LoginPage({Key? key, this.toggleView}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(" "),
          automaticallyImplyLeading: false,
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
                    child: Image.asset(
                      'assets/images/FYP_logo.png',
                      height: 150,
                      width: 200,
                      fit: BoxFit.fitWidth,)),
              ),
            ),
            //PUT EMAIL FOR SIGNING IN
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top:15,bottom: 0),
              child: Form(
                key: _formKey,
              child: TextFormField(
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
              ),
            ),

            //PASSWORD FOR SIGNING
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
              child: TextFormField(
                  //validator: (val) => val!.length < 6 ? 'Enter password more than 6 char long' : null,
                  validator: (String? value){
                    if(value!.length < 6){
                      return "Password >6 chars long";
                    }
                    return null;
                  },
                  onChanged: (val){
                    setState(() => password = val.trim());
                  },
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ),

            // Sign In Button
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 130, 224, 170), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()){
                    setState(() => loading = true);
                       dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error = 'Could not Sign In';
                            loading = false;
                          });
                        }
                  } 
                 /* Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                      dynamic result = await _auth.signInAnon();
                      if (result == null){
                        print('error signing in');
                      }else {
                        print('signed in');
                        print(result.uid);
                      }*/
                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            SizedBox(height: 20.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            
            SizedBox(
              height: 20.0,
            ),

            TextButton(
              onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUpPage()));
              }, 
              child:
            Text('New User? Create Account'
            ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}