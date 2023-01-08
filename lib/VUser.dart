import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fyp_application/HomePage.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'package:fyp_application/MUser.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "View e-Card",
      home: VUser(),
    );
  }
}

class VUser extends StatefulWidget {
  @override
  _VUserState createState() => _VUserState();
}

class _VUserState extends State<VUser> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 130, 224, 170),        
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MUser()));
          },
        ),
       
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
         
          child: ListView(shrinkWrap: true, physics: ClampingScrollPhysics(),
            children: [
              Text(
                " ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
             
              SizedBox(
                height: 35,
              ),
              buildTextField("Name", "Arisya Dzahier", false),
              buildTextField("Username", "arisyadzahier", false),
              buildTextField("E-mail", "arisyad@gmail.com", false),
              buildTextField("Phone Number", "0123456789", false),
              SizedBox(
                height: 20,
              ),

              //Title
              DottedBorder(
                color: Colors.greenAccent,
                strokeWidth: 2,
                dashPattern: [
                  5,
                  5,
                ],
              child: Container(
                padding: const EdgeInsets.all(16.0),
                /*decoration: BoxDecoration(
                  border: Border.all(width: 2,),
                ),*/
                child: Align(alignment: Alignment.center,
                child: const Text(
                  "Blood Donation History",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                ),
              ),
              ),

              SizedBox(
                  height: 10,
              ),

              //Details of Blood Donation History 
              Card(
                  margin: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      ListTile(
                        title: Text('Campaign:'),
                        subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:'),
                            Text('Location:'),
                            Text('Serial No of Blood Pack:'),
                            Text('Amount Donated:'),
                          ],
                        ),
                      ),
                      Divider(height: 20,),
                      ListTile(
                        title: Text('Campaign:'),
                        subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:'),
                            Text('Location:'),
                            Text('Serial No of Blood Pack:'),
                            Text('Amount Donated:'),
                          ],
                        ),
                      ),
                       Divider(height: 20,),
                      ListTile(
                        title: Text('Campaign:'),
                        subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:'),
                            Text('Location:'),
                            Text('Serial No of Blood Pack:'),
                            Text('Amount Donated:'),
                          ],
                        ),
                      ),
                      Divider(height: 20,),
                      ListTile(
                        title: Text('Campaign:'),
                        subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:'),
                            Text('Location:'),
                            Text('Serial No of Blood Pack:'),
                            Text('Amount Donated:'),
                          ],
                        ),
                      ),
                      Divider(height: 20,),
                      ListTile(
                        title: Text('Campaign:'),
                        subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:'),
                            Text('Location:'),
                            Text('Serial No of Blood Pack:'),
                            Text('Amount Donated:'),
                          ],
                        ),
                      ),
                       Divider(height: 20,),
                      ListTile(
                        title: Text('Campaign:'),
                        subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:'),
                            Text('Location:'),
                            Text('Serial No of Blood Pack:'),
                            Text('Amount Donated:'),
                          ],
                        ),
                      ),
                       Divider(height: 20,),
                      ListTile(
                        title: Text('Campaign:'),
                        subtitle: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date:'),
                            Text('Location:'),
                            Text('Serial No of Blood Pack:'),
                            Text('Amount Donated:'),
                          ],
                        ),
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        readOnly: true,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}