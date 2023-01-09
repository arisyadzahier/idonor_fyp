import 'package:flutter/material.dart';
import 'package:fyp_application/HomePage.dart';
import 'package:fyp_application/widgets/nav-drawer.dart';
import 'package:fyp_application/MCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "View e-Card",
      home: VeCard(),
    );
  }
}

class VeCard extends StatefulWidget {
  @override
  _VeCardState createState() => _VeCardState();
}

class _VeCardState extends State<VeCard> {
  bool showPassword = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<QuerySnapshot<Object?>>? docRef;
  @override
  void initState() {
    super.initState();
    docRef = users.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eCard'),
        backgroundColor: Color.fromARGB(255, 130, 224, 170),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => MCard()));
          },
        ),
      ),
      body: _buildList(),
    );

    Column(
      children: <Widget>[ 
        Column(
          children: [
            Image(image: AssetImage('assets/images/eCard.jpeg')),
          ],
        ),
        //  _buildBox(),
        _buildList(),
      ],
    );
  }

  Widget _buildList() {
    return FutureBuilder(
      future: docRef,
      builder: (BuildContext context, snapshot) {
        print(snapshot);
        print(snapshot.hasData);
        if (snapshot.hasData) {
          var x = snapshot.data?.docs.map((e) => print(e['name']));
          return ListView.builder(
              padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  // DecorationImage(
                  //             fit: BoxFit.cover,
                  //             image: AssetImage(
                  //               'assets/images/eCard.jpeg',
                  //             )),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      // const Image(image: AssetImage('assets/images/eCard.jpeg')),
                      Text(
                        " ",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),

                      SizedBox(
                        height: 25,
                      ),
                      buildTextField(
                          "Name", snapshot.data?.docs[index]['name'], false),
                      buildTextField("Username",
                          snapshot.data?.docs[index]['username'], false),
                      buildTextField(
                          "E-mail", snapshot.data?.docs[index]['email'], false),
                      buildTextField("Phone Number",
                          snapshot.data?.docs[index]['phone'], false),
                      buildTextField("ID Number",
                          snapshot.data?.docs[index]['icnum'], false),
                      buildTextField("Blood Type",
                          snapshot.data?.docs[index]['bloodType'], false),
                      buildTextField("Weight",
                          snapshot.data?.docs[index]['weight'], false),
                      //buildTextField("Donate Since", "17/9/2018", false),
                    ],
                  ),
                );
              });
        }
        return Text("data");
      },
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
